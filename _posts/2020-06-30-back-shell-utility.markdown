---
layout: post
title: "Introducing the 'back' shell utility"
categories: bash utility CLI command traversal directory
---

 - Ever found yourself trying to acronymise `$pwd` to rude words when the result wraps?
 - Caught in your _Cellar_ without an easy exit door?
 - Are you drowning in your fs but can't quite type your way to the surface?

*In that case...*

### Introducing `back`

A simple shell utility to return to a **named** parent directory without having to know how many levels above your current directory it is.

See the code in my [dotfiles](https://github.com/ScottA38/dotfiles).

It even has autocompletion! (remember to source it with `source back-completion.bash`) to your bash shell init script.
