---
layout: post
title: "Learning PHP in 2020"
date: 2020-06-18 17:49:52 +0300
categories: php OO object-oriented learning opinion
---

<!-- ## Post contents
* intro: old PHP, MYSQL and verbose un-templated web pages
* Composer
* PHP 7.4.4 OO style and variable/parameter typing
* Eclipse PDT
* Docker containers
* Doctrine ORM **TODO**
* Conclusion -->

Recently I completed a task task to build a WebApp for a client that I want to work for. It was a long process, with lots of learning about technologies such as:

 * `PHP`
 * `Docker`
 * `PHPUnit (unit testing)`
 * `ORM libraries`
 * PHP IDEs

As a christening of my developer blog, I would like to share my thoughts since finishing such an assignment and how my opinion of PHP changed over the course of the task duration: since it's completion I feel that I have reframed my opinion on some old aspects of web development that I was not so keen to revisit.

I don't think that **anyone** who has touched web development in the 21st century could **really** have gone very far before looking at PHP forms and seeing these standard boilerplate warnings on almost every PHP tutorial on the net regarding [user input injection attacks](https://youtu.be/_jKylhJtPmI)...

***...like this***:


![sql warning](/assets/SQL_warning_1.png)
...*or **this***:

![sql warning](/assets/SQL_warning_2.png)
...*or **this***:
![sql warning](/assets/SQL_warning_3.png)

When originally approaching `PHP` I was only just managing `python2` string interpolation; no Object-Oriented programming etc. When you are hoping to make a webapp and the first thing that confronts your eyes upon a search for tutorial is that you might be 'vulnerable to hackers and spammers!' it is a tad daunting!

Even after wading through pages of warning and cautionary messages, debugging was also a headache: `var_dump()` - ing to screen and hard-to-detect syntax errors with `$_POST` variables

Don't even get me started on [XAMPP](https://www.apachefriends.org/index.html) - as a beginner programmer with little knowledge of even how to [nano](https://www.nano-editor.org/) into files; setting up a localhost [Apache server](https://httpd.apache.org/); what files to change; why you would even need a `php.ini` and finally what configuration is appropriate for you, deployment was just a headache-ridden string of hopeless Google searches.

It is little wonder then, that when I was offered a developer task in native PHP for a prospective employer a couple of months ago, I thought do I *really* want to read for the 20th time about how:
 * I should **always** escape special chars in input?
 * Attempt to write SQL and realise I don't have the faintest clue about what a ['JOIN TABLE'](https://www.w3schools.com/sql/sql_join.asp) is?
 * I should always set character encoding to 'utf-8' in every php document even though I'm not sure what happens if I don't?

...so I decided to attempt it anyway, mainly because I want the job. Here are the discoveries I made along the way.  


### <img src="/assets/logo_composer.png" class="v-mid w5" alt="composer-logo"/> Composer

I first heard of the [Composer](https://getcomposer.org/) package manager in 2019 from an article *long-cleared from browser* - I took it as a framework tool for building WebApps with PHP, but from memory the article wrote that Composer helped to alleviate some of the archaic character traits and vulnerabilities that have previously hindered the PHP development language. I was not interested in finding out at the time however: I was nose-deep into [`node`](https://nodejs.org/en/) and [`npm`](https://www.npmjs.com/).

Upon commencing my task I would have to admit that initially [Composer](https://getcomposer.org/) did give me some major headaches, mainly due to my reluctance to fully read the PHP [PSR-4 autoloading standard](https://www.php-fig.org/psr/psr-4/) which governs [the most modern iteration of Composer's generated autoloader](https://getcomposer.org/doc/04-schema.md#psr-4). <a name="footnote_1"></a>I spent at least a week running `composer dumpautoload` without changing much and hoping for the autloader to work\*.

Towards the end of the project I began to get to grips with Composer and I was glad for this - if I wanted to create small lightweight projects I would be much more confident about such a goal with [Composer](https://getcomposer.org/)

### <img src="/assets/php_fig_logo.png" class="v-mid w5" alt="php-fig-logo"/> PHP autoloading

PHP autoloading is a relatively new concept, and not one that was around when I was originally tinkering with XAMPP as a beginner, however it is more than likely that is a concept that you would need to know if you wanted to approach PHP development in 2020. If you do, make sure to [read the autoloading standard](https://www.php-fig.org/psr/psr-4/), it's not a standards document like you would [see on the W3C](https://www.w3.org/WAI/standards-guidelines/aria/) that would make your eyes bleed with it's exhaustiveness; it's concise and readable; all in all a friendly document (*not what I expected from a PHP community*).

The idea is that autoloading does away with direct filesystem references to PHP documents, meaning that you should only need `require_once` your autoloader at the primary entry point to your functional code, and then allow it to fetch the appropriate classes. It turns `require_once ../../../src/doo-dah/file.php` into `use WebApp\doo-dah\file`. Much nicer.

### <img src="/assets/eclipse_pdt_logo.png" class="v-mid w5" alt="eclipse_logo"/> PHP IDE

That [painful composer week](#footnote_1) made me realise that I needed to migrate IDE. The super-cool community-based plugin system of [Atom](https://atom.io/) seemed to have no hope of allowing me proper method autocompletion or pre-compiler checking etc. In general `atom` seemed to struggle to achieve these features for most languages, particularly the latter compiler checking.

For that reason I started looking for a free 'proper OO-IDE' for PHP. I was using PHP 7.4.4 and hoping to make best use of the 'proper-OO' [new features in PHP 7.4](https://www.php.net/releases/7_4_0.php) such as: variable type declarations. In the end <a name="footnote_2"></a>I picked [Eclipse PDT](https://www.eclipse.org/pdt/), not because it was open source but because I had a tiny bit of familiarity with the Eclipse project after taking some classroom courses on Java programming a few years ago \*\*.

Nonetheless I tried Eclipse PDT as an experiment, because it didn't cost me anything - a kind of cover-all bases attempt before I opted for something unfamiliar or a product with a premium attached. I put off migrating to Eclipse because in my memory it was a system of confusing GUI-only configurations and build errors that stopped me writing code.

I shouldn't have been sceptical however, because I successfully migrated to Eclipse very quickly - there was really very little to it, as they have [built-in composer support](https://marketplace.eclipse.org/content/composer-php-support). It didn't solve my [autoloading headache](#footnote_1) at the time, but it did allow me to immediately see invalid namespacing

### <img src="/assets/docker_logo.jpeg" class="v-mid w5" alt="docker-logo"/> Docker

I previously encountered [Docker](https://www.docker.com/) when I was downloading a development environment of [powerplant](https://github.com/Ecohackerfarm/powerplant). At the time a Powerplant project contributor tried to explain the Docker system to me but I was clueless. I am not sure how it works internally but I would describe it as a much more user-friendly and manipulable version of a virtual machine.

As with approaching PHP in general, approaching Docker seemed quite daunting for a couple of reasons:

 * *How would I* know whether my container was running correctly?
 * *How would I* get my containers to communicate with each other?
 * *How would I* know that my server in the container was correctly configured?

etcetera, etcetera.

It turns out that the beauty of docker containers for me was that you did not need to be precious about them:

For instance:

Do you think that something in your build process was off? `docker rm [container_hash/es]` and `docker-compose build && docker-compose up` to be sure that the error is not in build process. Everything will regenerate to your default configuration (usually with the help of a [dockerfile](https://docs.docker.com/engine/reference/builder/))

For a docker newbie [this tutorial](http://blog.adnansiddiqi.me/getting-started-with-docker/) was invaluable to me, so much so that I donated to the author.

I loaded a PHP-Apache image called: `php:7.4.4-apache`. By searching on [Docker hub](https://hub.docker.com/) you can create countless configurations. The docker-hub environment is almost like Github in that you can essentially fork any given existing setup and modify it to your needs, then publish again for others to tinker with.

On the other hand, Docker did take a lot of tinkering and Googling to get right, probably because I don't understand **almost anything** of what is going on behind the scenes. **Please also be aware** that setting up a docker container is only half of the battle - once you are in you may have to unleash some cool wizardry on your ssh shell inside of the container \*\*\*, or otherwise do a lot of Googling for the appropriate Apache config file (like [.htaccess](http://httpd.apache.org/docs/current/howto/htaccess.html)) to finalise a web server.

![docker-volume-diagram](/assets/docker_volumes.jpeg)
<sup>Above is a diagram which demonstrates how a host machine's directory might be 'mounted' inside of 2 different running Docker containers as a 'volume'</sup>

One very cool feature of [Docker](https://www.docker.com/) that really does make it a special development tool is [voluming](https://docs.docker.com/storage/volumes/). If you read the link don't run away screaming yet, just consider it a kind of persistent 'tunnel' of a specific directory on your filesystem to a specific 'mount loccation' of your docker container filesystem. Changed your local filesystem? Changes are mirrored and instantly propagated in your container.

### Conclusion

It turns out that PHP has moved on far more than I expected. Through the integration of:
 * An [autoloading protocol](https://www.php-fig.org/psr/psr-4/)
 * Proper OO class [property typing](https://www.php.net/manual/en/migration74.new-features.php#migration74.new-features.core.typed-properties)
 * A comprehensive [package manager, Composer](https://getcomposer.org/)
 * Finally a free and very [powerful IDE Eclipse](https://www.eclipse.org/pdt/)

...I learnt a lot and gained valuable experience in developing in PHP. The problems I mentioned in my introduction about sanitising user inputs and injection attacks don't seem to have gone away, but with technologies such as Docker making back end deployment and staging management a lot easier (and package managers abstracting away dependency management woes), it makes it easier for the programmer to focus on the important stuff, writing code.

#### Footnotes

[\*](#footnote_1) *A word to the wise on this problem, when encountering autoloading problems, **ALWAYS CHECK YOUR NAMESPACE DECLARATIONS FIRST! (ACND!)**. Many hours of fruitless debugging were in vain when the reason my autoloader couldn't find a class was because it was in a unit test directory with a `src/` namespace!*

[\*\*](#footnote_2) *For the record when I made my searches for IDE, many, many people recommended [PHPStorm](https://www.jetbrains.com/phpstorm/) despite the fact it was a premium product, whether on StackOverflow or otherwise. I have never used any products by JetBrains but the evidence that it could be a good bet if you have the money seemed compelling*

[\*\*\*](#footnote_3) `docker exec -it [container_hash] sh -c bash -l`
