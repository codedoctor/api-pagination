[![Build Status](https://travis-ci.org/codedoctor/api-pagination.svg?branch=master)](https://travis-ci.org/codedoctor/api-pagination)
[![Coverage Status](https://img.shields.io/coveralls/codedoctor/api-pagination.svg)](https://coveralls.io/r/codedoctor/api-pagination)
[![NPM Version](http://img.shields.io/npm/v/api-pagination.svg)](https://www.npmjs.org/package//api-pagination)
[![Dependency Status](https://gemnasium.com/codedoctor/api-pagination.svg)](https://gemnasium.com/codedoctor/api-pagination)
[![NPM Downloads](http://img.shields.io/npm/dm/api-pagination.svg)](https://www.npmjs.org/package/api-pagination)
[![Issues](http://img.shields.io/github/issues/codedoctor/api-pagination.svg)](https://github.com/codedoctor/api-pagination/issues)
[![HAPI 6.0](http://img.shields.io/badge/hapi-6.0-blue.svg)](http://hapijs.com)
[![API Documentation](http://img.shields.io/badge/API-Documentation-ff69b4.svg)](http://coffeedoc.info/github/codedoctor/api-pagination)

(C) 2014 Martin Wawrusch

Helpers to provide pagination for APIs

## So how does this work?

The basic idea is that pagination is a tricky beast, better left to the server. There are a few different approaches to deal with pagination, including adding them to the header. This one is a bit different. We add a _pagination object that contains all the info needed. Here is a typical input and what comes out of it:

```json
{  
   "items": ["a","b","c","d","e","f","g","h","l","m","a","b","c","d","e","f","g","h","l","m"],
   "requestCount":20,
   "requestOffset":60,
   "totalCount":205
}
```

result after conversion

```json
{  
   "items":[  
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "l",
      "m",
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "l",
      "m"
   ],
   "_pagination":{  
      "totalCount":205,
      "requestCount":20,
      "requestOffset":60,
      "requestPageNumber":3,
      "requestPageNumberDisplay":"4",
      "totalPageCount":11,
      "pagingKind":"paged",
      "previousUrl":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=40&count=20",
      "nextUrl":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=80&count=20",
      "firstUrl":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20",
      "lastUrl":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=200&count=20",
      "pages":[  
         {  
            "kind":"page",
            "pageNumber":0,
            "pageNumberDisplay":"1",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20"
         },
         {  
            "kind":"page",
            "pageNumber":1,
            "pageNumberDisplay":"2",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=20&count=20"
         },
         {  
            "kind":"page",
            "pageNumber":2,
            "pageNumberDisplay":"3",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=40&count=20"
         },
         {  
            "kind":"page",
            "pageNumber":3,
            "pageNumberDisplay":"4",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=60&count=20",
            "active":true
         },
         {  
            "kind":"page",
            "pageNumber":4,
            "pageNumberDisplay":"5",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=80&count=20"
         },
         {  
            "kind":"page",
            "pageNumber":5,
            "pageNumberDisplay":"6",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=100&count=20"
         },
         {  
            "kind":"page",
            "pageNumber":6,
            "pageNumberDisplay":"7",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=120&count=20"
         },
         {  
            "kind":"page",
            "pageNumber":7,
            "pageNumberDisplay":"8",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=140&count=20"
         },
         {  
            "kind":"separator"
         },
         {  
            "kind":"page",
            "pageNumber":10,
            "pageNumberDisplay":"11",
            "url":"http://www.hello.com:8012/my/rest?a=12&b=ss&offset=200&count=20"
         }
      ]
   }
}
```


## See also

* [hapi-auth-bearer-mw](https://github.com/codedoctor/hapi-auth-bearer-mw)
* [hapi-identity-store](https://github.com/codedoctor/hapi-identity-store)
* [hapi-mongoose-db-connector](https://github.com/codedoctor/hapi-mongoose-db-connector)
* [hapi-routes-authorization-and-session-management](https://github.com/codedoctor/hapi-routes-authorization-and-session-management)
* [hapi-routes-status](https://github.com/codedoctor/hapi-routes-status)
* [hapi-routes-users](https://github.com/codedoctor/hapi-routes-users)
* [hapi-routes-users-authorizations](https://github.com/codedoctor/hapi-routes-users-authorizations)
* [hapi-routes-roles](https://github.com/codedoctor/hapi-routes-roles)

and additionally

* [mongoose-identity-store-multi-tenant](https://github.com/codedoctor/mongoose-identity-store-multi-tenant)
* [mongoose-rest-helper](https://github.com/codedoctor/mongoose-rest-helper)
* [api-pagination](https://github.com/codedoctor/api-pagination)


## Contributing
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the package.json, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Martin Wawrusch 


