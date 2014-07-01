basecamp-ruby
========

A very lightweight ruby library without an http client for using Basecamp API

### Why clientless?

When integrating with more than one remote API (e.g. Basecamp and Freshbooks) you
can share one http client class between the multiple API clients, which enables
unified error and access handling.

### HTTP Client

The HTTP client is responsible for authorization, user agent and HTTP caching headers.
The HTTP client that is passed to the Basecamp::Client must implement the following methods, that this gem uses:
  * ```get(uri)``` - HTTP GET request, which returns the response body as JSON