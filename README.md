# solicitor-search-api
== README

## Limits
The number of records returned is limited to 10 for solicitors and firms.
All solicitors are returned for a firm


## endpoints
### Solicitors

#### index - /solicitors
#### show - /solicitors/:id
#### search - /solicitors/search?q=QUERY (POST)
#### search_solicitor - /firms/:id/solicitors/search?q=QUERY (POST)
```
{
  "solicitors": [
    {
      "firm": {
        "tel": "780-843-5663 x98708",
        "name": "Hand, Marquardt and Fisher",
        "created_at": "2015-01-28T15:27:30.190Z",
        "updated_at": "2015-01-28T15:27:30.190Z",
        "email": "jaiden@volkman.biz",
        "postcode": "AM4 8BS",
        "address": "298 Jovanny Orchard Sweden",
        "id": 11
      },
      "name": "Miss Kassandra Collier",
      "mobile": "(941) 500-5295 x36729",
      "created_at": "2015-01-28T15:27:30.223Z",
      "updated_at": "2015-01-28T15:27:30.223Z",
      "id": 52,
      "firm_id": 11,
      "postcode": "MT9 8FZ",
      "address": "1690 Flo Flat Tanzania",
      "email": "frederique_lowe@corkery.net"
    }
  ]
}
```
### Firms

#### index - /firms
#### show - /firms/:id/solicitors
#### search - /firms/search/:query

```
{
  "firms": [
    {
      "tel": "(192) 667-9721 x426",
      "name": "Purdy, Feeney and Torphy",
      "created_at": "2015-01-27T17:41:51.362Z",
      "solicitors": [
        {
          "name": "Jena Dickinson",
          "mobile": "173-455-3487 x0571",
          "created_at": "2015-01-27T17:41:51.365Z",
          "updated_at": "2015-01-27T17:41:51.365Z",
          "id": 11,
          "firm_id": 3,
          "postcode": "DQ6 6UV",
          "address": "90967 Annabel Flats Qatar",
          "email": "stacey_mosciski@roobjerde.org"
        }
      ],
      "updated_at": "2015-01-27T17:41:51.362Z",
      "id": 3,
      "postcode": "HF9 7XK",
      "address": "7654 Eulalia Tunnel Western Sahara",
      "email": "darion_cummings@williamson.biz"
    }
  ]
}
```

### Search

#### search - /search/:query
```
{
  "firms": [
    {
      "tel": "780-843-5663 x98708",
      "name": "Hand, Marquardt and Fisher",
      "created_at": "2015-01-28T15:27:30.190Z",
      "solicitors": [
        {
          "name": "Christ McGlynn IV",
          "mobile": "413-125-9239",
          "created_at": "2015-01-28T15:27:30.214Z",
          "updated_at": "2015-01-28T15:27:30.214Z",
          "email": "araceli.harber@kuhickeler.net",
          "firm_id": 11,
          "postcode": "RP8 8LD",
          "address": "7083 Allie Brook Vanuatu",
          "id": 51
        }
      ],
      "updated_at": "2015-01-28T15:27:30.190Z",
      "email": "jaiden@volkman.biz",
      "postcode": "AM4 8BS",
      "address": "298 Jovanny Orchard Sweden",
      "id": 11
    }
  ],
  "solicitors": [
    {
      "firm": {
        "tel": "780-843-5663 x98708",
        "name": "Hand, Marquardt and Fisher",
        "created_at": "2015-01-28T15:27:30.190Z",
        "updated_at": "2015-01-28T15:27:30.190Z",
        "email": "jaiden@volkman.biz",
        "postcode": "AM4 8BS",
        "address": "298 Jovanny Orchard Sweden",
        "id": 11
      },
      "name": "Miss Kassandra Collier",
      "mobile": "(941) 500-5295 x36729",
      "created_at": "2015-01-28T15:27:30.223Z",
      "updated_at": "2015-01-28T15:27:30.223Z",
      "email": "frederique_lowe@corkery.net",
      "firm_id": 11,
      "postcode": "MT9 8FZ",
      "address": "1690 Flo Flat Tanzania",
      "id": 52
    }
  ]
}
```
