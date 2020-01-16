SELECT 
     p.ProductID 
   , p.ProductName 
   , p.Description ProductDescription 
   , p.ImagePath 
   , p.UnitPrice 
   , p.CategoryID 
   , c.CategoryName 
   , c.Description CategoryDescription 
  FROM Products p 
   INNER JOIN Categories c 
  ON p.CategoryID = c.CategoryID