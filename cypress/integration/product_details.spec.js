beforeEach(() => {
  cy.visit("http://localhost:3000")
})
it("Can navigate from the home page to the product detail page", () => {
  cy.get(".products article")
    .first().click();
});
