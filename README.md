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

## Prompt

We have an adjacency list that creates a tree of nodes where a child's parent_id = a parent's id. I have provided some sample data in the attached csv.

Please make an api (rails, sinatra, cuba--your choice) that has one endpoint: /common_ancestor. It should take two params, a and b, and it should return the root_id, lowest_common_ancestor_id, and depth of tree of the lowest common ancestor that those two node ids share.

For example, given the data for nodes:
   id    | parent_id
---------+-----------
     125 |       130
     130 |          
 2820230 |       125
 4430546 |       125
 5497637 |   4430546

/common_ancestor?a=5497637&b=2820230 should return
{root_id: 130, lowest_common_ancestor: 125, depth: 2}

/common_ancestor?a=5497637&b=130 should return
{root_id: 130, lowest_common_ancestor: 130, depth: 1}

/common_ancestor?a=5497637&b=4430546 should return
{root_id: 130, lowest_common_ancestor: 4430546, depth: 3}

if there is no common node match, return null for all fields

/common_ancestor?a=9&b=4430546 should return
{root_id: null, lowest_common_ancestor: null, depth: null}

if a==b, it should return itself

/common_ancestor?a=4430546&b=4430546 should return
{root_id: 130, lowest_common_ancestor: 4430546, depth: 3}

### Part 1
You should be able to load the data into the database, and assume that a different process will mutate the database, so while the most efficient way to solve this problem probably involves pre-processing the data and then serving that pre-processed data, I would like you to store the data in postgres in an effort to emulate data that is dynamic and expanding.

### Part 2
The next requirement for this project involves considering a second model, birds. Nodes have_many birds and birds belong_to nodes. Our second endpoint will take an array of node ids and return the ids of the birds that belong to one of those nodes or any descendant nodes.

The key here is really to see how you deal with trees in a db and rails, which is kind of a weird thing most people haven't thought about much. I would consider researching the ways that trees get persisted in databases, you might check out the ltree or recursion. The real tricky part is how to build it such that when we add the birds then we don't end up with N+1 queries.
