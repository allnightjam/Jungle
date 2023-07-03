beforeEach(() => {
  cy.signup("user2", `user${new Date().getTime()}@user.com`, "1232")
})
it("Can click add to cart button and the cart button changes", () => {
  cy.get(".products article")
    .contains("Add").first().click({force:true})
    .visit("/")
    .contains("My Cart (1)");
});