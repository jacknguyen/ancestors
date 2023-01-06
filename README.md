# Ancestors

## Requirements

- [Ruby]
- [Bundler]
- [Redis]
- [PostgreSQL]

[Ruby]: https://www.ruby-lang.org/en/
[Bundler]: https://bundler.io/
[Redis]: https://redis.io/
[PostgreSQL]: https://www.postgresql.org/

## Getting Started

1. Clone the repository & install gems:

  ```console
  $ cd more_guac
  $ bundle install
  ```

2. You will now seed the database:

  ```console
  $ bin/rails db:setup
  ```
  Alternatively you can also run and seed the common_ancestors and birds separately.

  ```console
  $ bin/rails db:create
  $ bin/rails db:seed:common_ancestors
  $ bin/rails db:seed:birds

  ```
3. Launch the development server:

  ```console
    $ bin/rails server
  ```
4. Navigate to http://localhost:3000/common_ancestors

## Testing

You can run all tests with:

```console
$ rails test
```

## NOTES
I didn't use a foreign_key index on common_ancestors table due to the nature of the CSV data. The data would need to be sorted by root node first.

Available endpoints:
- http://localhost:3000/common_ancestors
  - Accepts `a` and `b` as params
- http://localhost:3000/birds
  - Accepts `q` as param
