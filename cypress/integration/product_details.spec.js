describe("Product Page", () => {

  beforeEach(() => {
    cy.visit("/");
  });
  
  it("Clicking on the product Giant Tea", () => {
    cy.contains("Giant Tea")
    .click();
  });

  it("Clicking on the product Scented Blade", () => {
    cy.contains("Scented Blade")
    .click();
  });

});