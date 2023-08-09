ruby version 3.1.4
rails version 6.1.7.4

for start 
`rails db:create` 
`rails db:migrate`
`rails db:seed`
bundle exec rspec 
`foreman start`
http://localhost:3000/graphiql
maybe need gem install foreman

some query and mutation

query getArtist($id: ID!) {
  artist(id: $id) {
    firstName
    lastName
    items {
      id
      title
      description
    }
  }
}

variables {"id": 99}

 mutation createArtist($firstName: String!, $lastName: String!) {
  createArtist(input: {firstName: $firstName, lastName: $lastName}) {
    id
    firstName
    lastName
  }
}

variables {"firstName": "asdasd", "lastName": "asdasd"}
