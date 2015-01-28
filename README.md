# solicitor-search-api
== README

rake server will run this app on port 4000

## endpoints
### Solicitors

#### index - /solicitors
#### show - /solicitors/:id
#### search - /solicitors/search/:query
```
{
  "solicitors": [
    {
      "name": "Dr. Kathleen Crooks",
      "mobile": "1-166-473-6433 x95765",
      "created_at": "2015-01-27T17:41:53.809Z",
      "updated_at": "2015-01-27T17:41:53.809Z",
      "id": 84,
      "firm_id": 17,
      "postcode": "UF6 5OW",
      "address": "4381 Becker Tunnel Timor-Leste",
      "email": "otis.barton@towneheller.org"
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
      "updated_at": "2015-01-27T17:41:51.362Z",
      "email": "darion_cummings@williamson.biz",
      "postcode": "HF9 7XK",
      "address": "7654 Eulalia Tunnel Western Sahara",
      "id": 3
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
      "tel": "(192) 667-9721 x426",
      "name": "Purdy, Feeney and Torphy",
      "created_at": "2015-01-27T17:41:51.362Z",
      "solicitors": [
        {
          "name": "Jena Dickinson",
          "mobile": "173-455-3487 x0571",
          "created_at": "2015-01-27T17:41:51.365Z",
          "updated_at": "2015-01-27T17:41:51.365Z",
          "email": "stacey_mosciski@roobjerde.org",
          "firm_id": 3,
          "postcode": "DQ6 6UV",
          "address": "90967 Annabel Flats Qatar",
          "id": 11
        }
      ],
      "updated_at": "2015-01-27T17:41:51.362Z",
      "email": "darion_cummings@williamson.biz",
      "postcode": "HF9 7XK",
      "address": "7654 Eulalia Tunnel Western Sahara",
      "id": 3
    }
  ],
  "solicitors": [
    {
      "name": "Dr. Kathleen Crooks",
      "mobile": "1-166-473-6433 x95765",
      "created_at": "2015-01-27T17:41:53.809Z",
      "updated_at": "2015-01-27T17:41:53.809Z",
      "id": 84,
      "firm_id": 17,
      "postcode": "UF6 5OW",
      "address": "4381 Becker Tunnel Timor-Leste",
      "email": "otis.barton@towneheller.org"
    }
  ]
}
```
