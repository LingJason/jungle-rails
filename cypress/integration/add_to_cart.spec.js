describe("Add to Cart", () => {

  beforeEach(() => {
    cy.visit("/")
      .contains("Scented Blade")
      .click();
  });
  
  it("Add Product to cart", () => {
     cy.contains(" Add ").click({force: true});

     cy.contains("My Cart (1)");
  });

});