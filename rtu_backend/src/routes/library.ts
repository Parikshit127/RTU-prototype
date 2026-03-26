import { Router, Request, Response } from 'express';

const libraryRoutes = Router();

libraryRoutes.get('/', (req: Request, res: Response) => {
  const mockLibrary = {
    books: [
      {
        id: 'book1',
        title: 'Advanced Web Development',
        author: 'John Smith',
        isbn: '978-1234567890',
        available: true
      },
      {
        id: 'book2',
        title: 'Software Engineering Principles',
        author: 'Jane Doe',
        isbn: '978-0987654321',
        available: false
      },
      {
        id: 'book3',
        title: 'Database Design and Optimization',
        author: 'Bob Johnson',
        isbn: '978-1122334455',
        available: true
      }
    ],
    totalBooks: 3,
    availableCount: 2
  };

  res.json(mockLibrary);
});

export { libraryRoutes };
