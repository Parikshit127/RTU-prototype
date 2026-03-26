import { Router, Request, Response } from 'express';
import { events } from '../data/mock-data';

const eventsRoutes = Router();

eventsRoutes.get('/', (req: Request, res: Response) => {
  const category = req.query.category as string | undefined;

  if (category) {
    const filtered = events.filter((event: any) => event.category.toLowerCase() === category.toLowerCase());
    res.json(filtered);
  } else {
    res.json(events);
  }
});

eventsRoutes.get('/:id', (req: Request, res: Response) => {
  const eventId = req.params.id;
  const event = events.find((evt: any) => evt.id === eventId);

  if (event) {
    res.json(event);
  } else {
    res.status(404).json({ error: 'Event not found' });
  }
});

export { eventsRoutes };
