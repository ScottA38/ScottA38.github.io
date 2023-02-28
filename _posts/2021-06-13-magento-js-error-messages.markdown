---
layout: post
title: "Idiosyncrasies of the Magento 2 JS message system"
categories: php magento magento2 javascript cookie ajax ajax-complete http
---
# The problem

Recently, I have been trying to convert some Product-rendering UI logic from a server-side php approach to a client-side JS UiComponent approach in Magento 2.3 EE.

At one point I started trying to trigger Magento 2 error messages from PHP to JS-triggered due to the fact that product data delivery was now changed to delivery via AJAX request. I made an M2 JSON controller which accepted POST requests only:

```
namespace Vendor\Module\Controller\Action;

use Magento\Framework\App\Action;

class JSONController extends Action implements HttpPostActionInterface
{
  /**
   * @var JsonResultFactory
  protected $jsonResultFactory;

  //some props

  public function __construct(
    JsonResultFactory $jsonResultFactory
    //some props
  )
  {
    //some init
  }

  public function execute()
  {
    return $this->jsonResultFactory->create()
      ->setResponseCode(200)
      ->setData(['some' => 'data']);
  }
}
```

I called this controller via jQuery AJAX
```
define([
  //some modules
  ], function () {
    return Element.Extend({
    ...
    getProductData: function() {
      return $.ajax({
        accept: 'application/json',
        action: 'POST',
        url: 'module/action/jsoncontroller'
        data: {
          productGroup: selfProductGroup
        }
      }, self);
    }
    ...
  });
```

All looks good - after some tweaking I got the data I wanted on the frontend. Google-ing for the correct way to implement messages ensued.

Then I exhausted all my options, and nothing worked.
 - []()
 - []()
 - []()

So I left it for a moment, but whilst debugging an issue with data return I noticed that my error message **was** appearing when I was debugging the AJAX return in the debugger. As soon as the AJAX 'fail' method was completed however it was gone. *How can this be?!*

At the time I was using the following code in my UiComponent:
```
                customerData.set('messages', {
                    messages: [{
                        text: $t('There\'s been an error.'),
                        type: 'error'
                    }]
                });
```
...but I am sure other solutions offered on SO (as per links above would work).

But the important part for me was in Magento (2.3.1) core code, namely `vendor/magento/module-customer/view/frontend/web/js/customer-data.js::392`
```
    /**
     * Events listener
     */
    $(document).on('ajaxComplete', function (event, xhr, settings) {
        var sections,
            redirects;

        if (settings.type.match(/post|put|delete/i)) {
            sections = sectionConfig.getAffectedSections(settings.url);

            if (sections) {
                customerData.invalidate(sections);
                redirects = ['redirect', 'backUrl'];

                if (_.isObject(xhr.responseJSON) && !_.isEmpty(_.pick(xhr.responseJSON, redirects))) { //eslint-disable-line
                    return;
                }
                customerData.reload(sections, true);
            }
        }
    });
```

This code means that more-or-less ANY post request using the jQuery `.ajax` method\*, will cause all of the messages you have added via JS to reset.

\* Unless it does not create any 'affected sections' - you will have to inspect the code yourself to see what I mean. Regardless I believe is an unlikely case
