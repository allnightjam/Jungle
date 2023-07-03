// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })
Cypress.Commands.add('login', (email, password) => {
  cy.visit('/login')

  cy.get('input[name=email]').type(email)

  // {enter} causes the form to submit
  cy.get('input[name=password]').type(`${password}{enter}`, { log: false })

  // we should be redirected to /dashboard
  cy.url().should('include', '/')

  // UI should reflect this user being logged in
  cy.get('.navbar-nav').should('contain', "Signed in as")
})


Cypress.Commands.add('signup', (name, email, password) => {
  cy.visit('/signup')

  cy.get('input[name=user\\[name\\]]').type(name)

  cy.get('input[name=user\\[email\\]]').type(email)

  cy.get('input[name=user\\[password\\]]').type(password, { log: false })
  
  // {enter} causes the form to submit
  cy.get('input[name=user\\[password_confirmation\\]]').type(`${password}{enter}`, { log: false })

  cy.url().should('include', '/')

  // UI should reflect this user being logged in
  cy.get('.navbar-nav').should('contain', "Signed in as")
})