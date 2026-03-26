'use client';

import { CreditCard, CheckCircle2, Clock, AlertCircle, FileText, Euro } from 'lucide-react';

const feesSummary = {
  totalDue: 2200,
  paid: 1100,
  remaining: 1100,
  nextDue: 'March 31, 2026',
};

const payments = [
  { id: 'PAY-2026-002', date: 'Jan 15, 2026', amount: 1100, type: 'Tuition — Spring 2026 (1/2)', status: 'Paid' },
  { id: 'PAY-2025-004', date: 'Sep 1, 2025', amount: 1100, type: 'Tuition — Autumn 2025 (2/2)', status: 'Paid' },
  { id: 'PAY-2025-003', date: 'Jul 15, 2025', amount: 1100, type: 'Tuition — Autumn 2025 (1/2)', status: 'Paid' },
  { id: 'PAY-2025-002', date: 'Jan 15, 2025', amount: 1100, type: 'Tuition — Spring 2025 (2/2)', status: 'Paid' },
  { id: 'PAY-2025-001', date: 'Jan 2, 2025', amount: 1100, type: 'Tuition — Spring 2025 (1/2)', status: 'Paid' },
];

const upcomingFees = [
  { description: 'Tuition — Spring 2026 (2/2)', amount: 1100, due: 'March 31, 2026', status: 'Due' },
  { description: 'Student Union Fee', amount: 15, due: 'April 1, 2026', status: 'Upcoming' },
];

export default function FeesPage() {
  return (
    <div className="bg-surface-bg min-h-screen">
      {/* Header */}
      <div className="bg-gradient-to-r from-rtu-green to-rtu-green-dark">
        <div className="rtu-container py-8">
          <h1 className="text-2xl font-bold text-white">Tuition & Fees</h1>
          <p className="text-sm text-white/70">Academic Year 2025/2026</p>
        </div>
      </div>

      <div className="rtu-container py-6">
        {/* Summary Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
          <div className="rtu-card text-center border-t-4 border-t-rtu-green">
            <Euro className="h-8 w-8 text-rtu-green mx-auto mb-2" />
            <p className="text-3xl font-extrabold text-text-primary">€{feesSummary.totalDue.toLocaleString()}</p>
            <p className="text-sm text-text-secondary">Total Annual Tuition</p>
          </div>
          <div className="rtu-card text-center border-t-4 border-t-green-500">
            <CheckCircle2 className="h-8 w-8 text-green-500 mx-auto mb-2" />
            <p className="text-3xl font-extrabold text-green-600">€{feesSummary.paid.toLocaleString()}</p>
            <p className="text-sm text-text-secondary">Paid This Year</p>
          </div>
          <div className="rtu-card text-center border-t-4 border-t-orange-500">
            <Clock className="h-8 w-8 text-orange-500 mx-auto mb-2" />
            <p className="text-3xl font-extrabold text-orange-600">€{feesSummary.remaining.toLocaleString()}</p>
            <p className="text-sm text-text-secondary">Due by {feesSummary.nextDue}</p>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-6">
            {/* Upcoming Fees */}
            <div>
              <h2 className="text-lg font-bold text-text-primary mb-4">Upcoming Payments</h2>
              <div className="space-y-3">
                {upcomingFees.map((fee) => (
                  <div key={fee.description} className="rtu-card flex items-center justify-between">
                    <div className="flex items-center gap-4">
                      <div className={`w-10 h-10 rounded-xl flex items-center justify-center ${
                        fee.status === 'Due' ? 'bg-orange-100' : 'bg-blue-100'
                      }`}>
                        {fee.status === 'Due' ? (
                          <AlertCircle className="h-5 w-5 text-orange-600" />
                        ) : (
                          <Clock className="h-5 w-5 text-blue-600" />
                        )}
                      </div>
                      <div>
                        <p className="font-semibold text-text-primary text-sm">{fee.description}</p>
                        <p className="text-xs text-text-secondary">Due: {fee.due}</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-text-primary">€{fee.amount}</p>
                      <span className={`rtu-badge text-xs ${
                        fee.status === 'Due' ? 'bg-orange-100 text-orange-700' : 'bg-blue-100 text-blue-700'
                      }`}>
                        {fee.status}
                      </span>
                    </div>
                  </div>
                ))}
              </div>
              <button className="rtu-btn-primary mt-4 w-full md:w-auto">
                <CreditCard className="h-4 w-4 mr-2" /> Make Payment
              </button>
            </div>

            {/* Payment History */}
            <div>
              <h2 className="text-lg font-bold text-text-primary mb-4">Payment History</h2>
              <div className="rtu-card overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="text-left text-text-secondary border-b">
                      <th className="pb-3 font-medium">Reference</th>
                      <th className="pb-3 font-medium">Date</th>
                      <th className="pb-3 font-medium">Description</th>
                      <th className="pb-3 font-medium text-right">Amount</th>
                      <th className="pb-3 font-medium text-right">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {payments.map((p) => (
                      <tr key={p.id} className="border-b border-gray-50 last:border-0">
                        <td className="py-3 font-mono text-xs text-text-secondary">{p.id}</td>
                        <td className="py-3 text-text-secondary">{p.date}</td>
                        <td className="py-3 text-text-primary font-medium">{p.type}</td>
                        <td className="py-3 text-right font-semibold">€{p.amount}</td>
                        <td className="py-3 text-right">
                          <span className="rtu-badge bg-green-100 text-green-700 text-xs">{p.status}</span>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            <div className="rtu-card">
              <h3 className="font-bold text-text-primary mb-3">Payment Methods</h3>
              <p className="text-sm text-text-secondary leading-relaxed mb-4">
                RTU accepts bank transfers and online card payments through the student portal.
              </p>
              <div className="space-y-2 text-sm">
                <div className="flex justify-between">
                  <span className="text-text-secondary">Bank</span>
                  <span className="font-medium text-text-primary">Swedbank</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-text-secondary">IBAN</span>
                  <span className="font-mono text-xs text-text-primary">LV80HABA...4521</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-text-secondary">Reference</span>
                  <span className="font-mono text-xs text-text-primary">RTU-2024-1847</span>
                </div>
              </div>
            </div>

            <div className="rtu-card">
              <h3 className="font-bold text-text-primary mb-3">Need Help?</h3>
              <p className="text-sm text-text-secondary leading-relaxed">
                Contact the Financial Office for payment plans, scholarships, or billing questions.
              </p>
              <p className="text-sm font-medium text-rtu-green mt-2">finance@rtu.lv</p>
              <p className="text-sm text-text-secondary">+371 67089455</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
