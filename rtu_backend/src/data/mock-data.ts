// ═══════════════════════════════════════════════════════════════
// RTU MOCK DATA — Shared between mobile app and website
// ═══════════════════════════════════════════════════════════════
// This file contains all mock data for the prototype.
// POST-CONTRACT: Replace these with database queries or ORTUS API calls.
// The route handlers won't change — only the data source functions.
// ═══════════════════════════════════════════════════════════════

export const studentProfile = {
  id: 'RTU-2024-0712',
  firstName: 'Jānis',
  lastName: 'Bērziņš',
  email: 'janis.berzins@edu.rtu.lv',
  studentId: '201RDB045',
  faculty: 'Faculty of Computer Science, Information Technology and Energy',
  program: 'Computer Science',
  semester: 5,
  yearOfStudy: 3,
  enrollmentYear: 2023,
  gpa: 7.8,
  totalCredits: 120,
  requiredCredits: 240,
  profileImageUrl: null,
  phone: '+371 20123456',
  language: 'en',
  dormitory: 'Ķīpsala Student Dormitory',
  advisorName: 'Prof. Dr. Māris Kalniņš',
  advisorEmail: 'maris.kalnins@rtu.lv',
};

export const schedule = {
  semester: 'Spring 2026',
  weekStartDate: '2026-03-16',
  classes: [
    { id: 'cls-001', courseName: 'Data Structures and Algorithms', courseCode: 'DatZ3001', type: 'Lecture', professor: 'Prof. Andris Liepiņš', room: 'ĶII-420', building: 'Ķīpsala II', dayOfWeek: 1, startTime: '08:30', endTime: '10:05', colorIndex: 0 },
    { id: 'cls-002', courseName: 'Data Structures and Algorithms', courseCode: 'DatZ3001', type: 'Lab', professor: 'Mg. Elīna Krūmiņa', room: 'ĶII-316', building: 'Ķīpsala II', dayOfWeek: 1, startTime: '10:30', endTime: '12:05', colorIndex: 0 },
    { id: 'cls-003', courseName: 'Operating Systems', courseCode: 'DatZ4020', type: 'Lecture', professor: 'Prof. Kārlis Podnieks', room: 'ĶI-202', building: 'Ķīpsala I', dayOfWeek: 1, startTime: '14:30', endTime: '16:05', colorIndex: 1 },
    { id: 'cls-004', courseName: 'Web Technologies', courseCode: 'DatZ3045', type: 'Lecture', professor: 'Doc. Inga Straupe', room: 'ĶII-301', building: 'Ķīpsala II', dayOfWeek: 2, startTime: '08:30', endTime: '10:05', colorIndex: 2 },
    { id: 'cls-005', courseName: 'Web Technologies', courseCode: 'DatZ3045', type: 'Lab', professor: 'Doc. Inga Straupe', room: 'ĶII-316', building: 'Ķīpsala II', dayOfWeek: 2, startTime: '10:30', endTime: '12:05', colorIndex: 2 },
    { id: 'cls-006', courseName: 'Discrete Mathematics', courseCode: 'MatZ2001', type: 'Lecture', professor: 'Prof. Valdis Segliņš', room: 'ĶI-115', building: 'Ķīpsala I', dayOfWeek: 2, startTime: '14:30', endTime: '16:05', colorIndex: 3 },
    { id: 'cls-007', courseName: 'Software Engineering', courseCode: 'DatZ4015', type: 'Lecture', professor: 'Prof. Dr. Jānis Grabis', room: 'ĶII-420', building: 'Ķīpsala II', dayOfWeek: 3, startTime: '10:30', endTime: '12:05', colorIndex: 4 },
    { id: 'cls-008', courseName: 'Discrete Mathematics', courseCode: 'MatZ2001', type: 'Seminar', professor: 'Mg. Dace Āboliņa', room: 'ĶI-320', building: 'Ķīpsala I', dayOfWeek: 3, startTime: '14:30', endTime: '16:05', colorIndex: 3 },
    { id: 'cls-009', courseName: 'Operating Systems', courseCode: 'DatZ4020', type: 'Lab', professor: 'Mg. Rihards Ozols', room: 'ĶII-316', building: 'Ķīpsala II', dayOfWeek: 4, startTime: '08:30', endTime: '10:05', colorIndex: 1 },
    { id: 'cls-010', courseName: 'Software Engineering', courseCode: 'DatZ4015', type: 'Lab', professor: 'Mg. Toms Kalvāns', room: 'ĶII-316', building: 'Ķīpsala II', dayOfWeek: 4, startTime: '10:30', endTime: '12:05', colorIndex: 4 },
    { id: 'cls-011', courseName: 'Latvian Language B2', courseCode: 'ValZ1002', type: 'Seminar', professor: 'Mg. Līga Vītoliņa', room: 'ĶI-105', building: 'Ķīpsala I', dayOfWeek: 5, startTime: '10:30', endTime: '12:05', colorIndex: 5 },
    { id: 'cls-012', courseName: 'Physical Education', courseCode: 'SpoZ1001', type: 'Lab', professor: 'Mg. Aigars Rudzītis', room: 'Sports Hall', building: 'RTU Sports Center', dayOfWeek: 5, startTime: '14:30', endTime: '16:05', colorIndex: 6 },
  ],
};

export const grades = {
  semesters: [
    {
      id: 'sem-5', name: 'Fall 2025', semesterNumber: 5, gpa: 7.8, totalCredits: 30,
      courses: [
        { courseName: 'Data Structures and Algorithms', courseCode: 'DatZ3001', credits: 6, grade: 8, gradeLabel: 'Very Good', professor: 'Prof. Andris Liepiņš' },
        { courseName: 'Operating Systems', courseCode: 'DatZ4020', credits: 4, grade: 7, gradeLabel: 'Good', professor: 'Prof. Kārlis Podnieks' },
        { courseName: 'Web Technologies', courseCode: 'DatZ3045', credits: 6, grade: 9, gradeLabel: 'Excellent', professor: 'Doc. Inga Straupe' },
        { courseName: 'Discrete Mathematics', courseCode: 'MatZ2001', credits: 4, grade: 7, gradeLabel: 'Good', professor: 'Prof. Valdis Segliņš' },
        { courseName: 'Software Engineering', courseCode: 'DatZ4015', credits: 6, grade: 8, gradeLabel: 'Very Good', professor: 'Prof. Dr. Jānis Grabis' },
        { courseName: 'Latvian Language B2', courseCode: 'ValZ1002', credits: 2, grade: 8, gradeLabel: 'Very Good', professor: 'Mg. Līga Vītoliņa' },
      ],
    },
    {
      id: 'sem-4', name: 'Spring 2025', semesterNumber: 4, gpa: 7.5, totalCredits: 30,
      courses: [
        { courseName: 'Object-Oriented Programming', courseCode: 'DatZ2010', credits: 6, grade: 8, gradeLabel: 'Very Good', professor: 'Prof. Edgars Celms' },
        { courseName: 'Database Systems', courseCode: 'DatZ3010', credits: 6, grade: 7, gradeLabel: 'Good', professor: 'Doc. Laila Niedrīte' },
        { courseName: 'Computer Networks', courseCode: 'DatZ3020', credits: 4, grade: 6, gradeLabel: 'Almost Good', professor: 'Prof. Guntis Bārzdiņš' },
        { courseName: 'Linear Algebra', courseCode: 'MatZ1003', credits: 4, grade: 8, gradeLabel: 'Very Good', professor: 'Prof. Aivars Bērziņš' },
        { courseName: 'Probability and Statistics', courseCode: 'MatZ2010', credits: 4, grade: 7, gradeLabel: 'Good', professor: 'Doc. Ilona Kopeika' },
        { courseName: 'Technical English C1', courseCode: 'ValZ2001', credits: 4, grade: 9, gradeLabel: 'Excellent', professor: 'Mg. Sandra Kalnāja' },
      ],
    },
  ],
  overallGpa: 7.8,
  totalCreditsEarned: 120,
  gpaHistory: [
    { semester: 1, gpa: 7.2 }, { semester: 2, gpa: 7.5 },
    { semester: 3, gpa: 8.0 }, { semester: 4, gpa: 7.5 }, { semester: 5, gpa: 7.8 },
  ],
};

export const events = [
  { id: 'evt-001', title: 'RTU Open Day 2026', description: 'Explore RTU faculties, meet professors, and learn about study programs.', category: 'Academic', date: '2026-03-28', startTime: '10:00', endTime: '16:00', location: 'RTU Main Building, Kaļķu iela 1', organizer: 'RTU Student Affairs', isBookmarked: false, imageUrl: null },
  { id: 'evt-002', title: 'Spring Career Fair', description: 'Meet top employers from the Baltic region. Over 50 companies.', category: 'Career', date: '2026-04-03', startTime: '11:00', endTime: '17:00', location: 'Ķīpsala Student House', organizer: 'RTU Career Center', isBookmarked: true, imageUrl: null },
  { id: 'evt-003', title: 'Hackathon: Green Energy Solutions', description: '48-hour hackathon focused on sustainable energy.', category: 'Academic', date: '2026-04-10', startTime: '18:00', endTime: '18:00', location: 'ĶII Innovation Hub', organizer: 'RTU Developer Club', isBookmarked: true, imageUrl: null },
  { id: 'evt-004', title: 'Student Council Elections', description: 'Vote for your faculty representatives.', category: 'Student Council', date: '2026-04-15', startTime: '09:00', endTime: '18:00', location: 'All RTU Buildings', organizer: 'RTU Student Parliament', isBookmarked: false, imageUrl: null },
  { id: 'evt-005', title: 'Spring Sports Festival', description: 'Annual inter-faculty sports competition.', category: 'Sports', date: '2026-04-20', startTime: '10:00', endTime: '18:00', location: 'RTU Sports Center, Ķīpsala', organizer: 'RTU Sports Department', isBookmarked: false, imageUrl: null },
  { id: 'evt-006', title: 'Guest Lecture: AI in Engineering', description: 'Distinguished lecture by Prof. Dr. Michael Chen from MIT.', category: 'Academic', date: '2026-03-25', startTime: '14:00', endTime: '16:00', location: 'ĶI-202 Auditorium', organizer: 'Faculty of Computer Science', isBookmarked: true, imageUrl: null },
  { id: 'evt-007', title: 'RTU Cultural Night', description: 'Celebrate cultural diversity with performances and food from 50+ countries.', category: 'Cultural', date: '2026-04-25', startTime: '18:00', endTime: '23:00', location: 'RTU Great Hall, Kaļķu iela 1', organizer: 'RTU International Office', isBookmarked: false, imageUrl: null },
];

export const fees = {
  balance: 1250.00,
  currency: 'EUR',
  invoices: [
    { id: 'inv-001', description: 'Tuition Fee — Spring 2026', amount: 1250.00, dueDate: '2026-04-05', status: 'pending', semester: 'Spring 2026' },
    { id: 'inv-002', description: 'Dormitory Fee — March 2026', amount: 85.00, dueDate: '2026-03-01', status: 'paid', paidDate: '2026-02-28', semester: 'Spring 2026' },
    { id: 'inv-003', description: 'Tuition Fee — Fall 2025', amount: 1250.00, dueDate: '2025-09-15', status: 'paid', paidDate: '2025-09-10', semester: 'Fall 2025' },
    { id: 'inv-004', description: 'Student Union Fee — 2025/2026', amount: 15.00, dueDate: '2025-09-01', status: 'paid', paidDate: '2025-08-30', semester: 'Fall 2025' },
  ],
};

export const notifications = [
  { id: 'notif-001', title: 'Exam Registration Open', body: 'Register for spring exams by April 1st.', type: 'academic', icon: 'assignment', isRead: false, createdAt: '2026-03-23T08:00:00Z', link: '/academics/exams' },
  { id: 'notif-002', title: 'Grade Posted', body: 'Web Technologies: 9 (Excellent)', type: 'academic', icon: 'grade', isRead: false, createdAt: '2026-03-23T05:00:00Z', link: '/academics/grades' },
  { id: 'notif-003', title: 'New Course Material', body: 'Software Engineering — Week 8 slides uploaded', type: 'elearning', icon: 'description', isRead: false, createdAt: '2026-03-22T14:00:00Z', link: '/courses/DatZ4015' },
  { id: 'notif-004', title: 'Fee Reminder', body: 'Tuition payment of €1,250 due by April 5th', type: 'financial', icon: 'payment', isRead: true, createdAt: '2026-03-22T09:00:00Z', link: '/fees' },
  { id: 'notif-005', title: 'Event Reminder', body: 'Guest Lecture: AI in Engineering — Tomorrow 14:00', type: 'event', icon: 'event', isRead: true, createdAt: '2026-03-21T10:00:00Z', link: '/events/evt-006' },
  { id: 'notif-006', title: 'Library Due', body: 'Return "Introduction to Algorithms" by March 25th', type: 'library', icon: 'library', isRead: true, createdAt: '2026-03-20T09:00:00Z', link: '/library' },
];

// ── PUBLIC WEBSITE DATA (not behind auth) ──

export const faculties = [
  { id: 'fac-01', name: 'Faculty of Computer Science, Information Technology and Energy', shortName: 'FCSIE', dean: 'Prof. Dr. Agris Ņikitenko', students: 3200, programs: 12, description: 'Leading faculty in computer science, IT, and energy engineering research and education.', location: 'Ķīpsala campus' },
  { id: 'fac-02', name: 'Faculty of Electronics and Telecommunications', shortName: 'FET', dean: 'Prof. Dr. Jurijs Dehtjars', students: 1800, programs: 8, description: 'Cutting-edge programs in electronics, telecommunications, and embedded systems.', location: 'Ķīpsala campus' },
  { id: 'fac-03', name: 'Faculty of Civil Engineering', shortName: 'FCE', dean: 'Prof. Dr. Leonīds Pakrastiņš', students: 2100, programs: 9, description: 'Education and research in civil engineering, construction, and architecture.', location: 'Ķīpsala campus' },
  { id: 'fac-04', name: 'Faculty of Mechanical Engineering, Transport and Aeronautics', shortName: 'FMETA', dean: 'Prof. Dr. Vitālijs Pavelko', students: 1500, programs: 10, description: 'Programs spanning mechanical engineering, automotive, aviation, and transport.', location: 'Ķīpsala campus' },
  { id: 'fac-05', name: 'Faculty of Materials Science and Applied Chemistry', shortName: 'FMSAC', dean: 'Prof. Dr. Māris Turks', students: 900, programs: 6, description: 'Research and education in materials science, chemical engineering, and nanotechnology.', location: 'Ķīpsala campus' },
  { id: 'fac-06', name: 'Faculty of Architecture', shortName: 'FA', dean: 'Prof. Dr. Uģis Bratuškins', students: 700, programs: 4, description: 'Creative and technical education in architecture, urban planning, and design.', location: 'Old Town campus' },
  { id: 'fac-07', name: 'Faculty of Engineering Economics and Management', shortName: 'FEEM', dean: 'Prof. Dr. Elīna Gaile-Sarkane', students: 2500, programs: 11, description: 'Business, economics, and management programs with an engineering focus.', location: 'Kaļķu iela campus' },
  { id: 'fac-08', name: 'Faculty of E-Learning Technologies and Humanities', shortName: 'FELTH', dean: 'Prof. Dr. Atis Kapenieks', students: 600, programs: 5, description: 'Innovative e-learning, digital humanities, and language technology.', location: 'Ķīpsala campus' },
];

export const news = [
  { id: 'news-001', title: 'RTU Ranks Among Top 5% of World Universities', summary: 'Riga Technical University has climbed to the top 5% in the QS World University Rankings 2026, reflecting its growing international reputation.', category: 'Rankings', date: '2026-03-20', imageUrl: null },
  { id: 'news-002', title: 'New AI Research Lab Opens at Ķīpsala Campus', summary: 'A state-of-the-art artificial intelligence research laboratory has opened, funded by a €2.5M EU Horizon grant.', category: 'Research', date: '2026-03-18', imageUrl: null },
  { id: 'news-003', title: 'RTU Students Win Baltic Hackathon', summary: 'Team of four CS students won first place at the Baltic Innovation Hackathon with their smart grid optimization solution.', category: 'Achievements', date: '2026-03-15', imageUrl: null },
  { id: 'news-004', title: 'Spring Semester Registration Deadline Extended', summary: 'Due to high demand, the registration deadline for spring elective courses has been extended to March 30.', category: 'Academic', date: '2026-03-12', imageUrl: null },
  { id: 'news-005', title: 'RTU Partners with Latvenergo for Green Campus Initiative', summary: 'A new partnership will install solar panels across Ķīpsala campus, reducing energy costs by 30%.', category: 'Sustainability', date: '2026-03-10', imageUrl: null },
  { id: 'news-006', title: 'Erasmus+ Exchange Applications Now Open', summary: 'Apply for Fall 2026 exchange programs at 150+ partner universities across Europe.', category: 'International', date: '2026-03-08', imageUrl: null },
];

export const admissionsInfo = {
  applicationDeadline: '2026-07-15',
  semesterStart: '2026-09-01',
  tuitionFees: {
    bachelor: { eu: 1250, nonEu: 3500, currency: 'EUR', perSemester: true },
    master: { eu: 1500, nonEu: 4000, currency: 'EUR', perSemester: true },
    doctoral: { eu: 1800, nonEu: 5000, currency: 'EUR', perSemester: true },
  },
  steps: [
    { step: 1, title: 'Choose Your Program', description: 'Browse our 65+ study programs across 8 faculties.' },
    { step: 2, title: 'Prepare Documents', description: 'Gather transcripts, language certificates, and identification documents.' },
    { step: 3, title: 'Submit Application', description: 'Apply online through the RTU application portal.' },
    { step: 4, title: 'Entrance Examination', description: 'Complete the entrance exam (if required for your program).' },
    { step: 5, title: 'Receive Decision', description: 'Admission decisions are sent within 2 weeks of application review.' },
    { step: 6, title: 'Enroll & Register', description: 'Accept your offer, pay the tuition fee, and register for courses.' },
  ],
  stats: {
    totalStudents: 14500,
    internationalStudents: 3200,
    countries: 50,
    programs: 65,
    faculties: 8,
    foundedYear: 1862,
  },
};

export const researchHighlights = [
  { id: 'res-001', title: 'Quantum Computing for Cryptography', faculty: 'FCSIE', lead: 'Prof. Dr. Andris Ambainis', funding: '€1.2M (EU Horizon)', status: 'Active', description: 'Developing quantum-resistant encryption algorithms for next-generation cybersecurity.' },
  { id: 'res-002', title: 'Smart Materials for Sustainable Construction', faculty: 'FMSAC', lead: 'Prof. Dr. Diana Bajāre', funding: '€800K (ERDF)', status: 'Active', description: 'Creating self-healing concrete and energy-efficient building materials.' },
  { id: 'res-003', title: 'Autonomous Drone Navigation', faculty: 'FMETA', lead: 'Prof. Dr. Aleksejs Rudzītis', funding: '€950K (NATO SPS)', status: 'Active', description: 'AI-powered drone navigation systems for search and rescue operations.' },
  { id: 'res-004', title: 'Baltic Sea Environmental Monitoring', faculty: 'FET', lead: 'Prof. Dr. Māris Ķimenājs', funding: '€600K (Interreg Baltic)', status: 'Active', description: 'IoT sensor networks for real-time monitoring of Baltic Sea water quality.' },
];
