import { Router, Request, Response } from 'express';
import { notifications } from '../data/mock-data';

const notificationsRoutes = Router();

notificationsRoutes.get('/', (req: Request, res: Response) => {
  const unread = req.query.unread === 'true';

  if (unread) {
    const unreadNotifications = notifications.filter((notif: any) => !notif.read);
    res.json(unreadNotifications);
  } else {
    res.json(notifications);
  }
});

export { notificationsRoutes };
