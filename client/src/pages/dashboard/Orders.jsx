import * as React from 'react';
import Link from '@mui/material/Link';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Title from './Title';

// Generate Order Data
function createData(id, date, name, shipTo, paymentMethod, amount) {
  return { id, date, name, shipTo, paymentMethod, amount };
}

const rows = [
  createData(
    0,
    '14 Dec, 2022',
    'Masala Dosa',
    'Aryan Shukla',
    'UPI ⠀•••• 3574',
    150,
  ),
  createData(
    1,
    '14 Dec, 2022',
    'Manchow Noodles',
    'Ashutosh Gangwar',
    'VISA ⠀•••• 2574',
    110,
  ),
  createData(2, '14 Dec, 2022', 'Burger with Fries', 'Shivam Koshta', 'OFFLINE ⠀•••• 1253', 200),
  createData(
    3,
    '14 Dec, 2022',
    'Veg Shawarma',
    'Harman Sandhu',
    'UPI ⠀•••• 2000',
    187,
  ),
  createData(
    4,
    '13 Dec, 2022',
    'Biriyani',
    'Mohammad Touseef',
    'OFFLINE ⠀•••• 5919',
    250,
  ),
];

function preventDefault(event) {
  event.preventDefault();
}

export default function Orders() {
  return (
    <React.Fragment>
      <Title>Recent Orders</Title>
      <Table size="small">
        <TableHead>
          <TableRow>
            <TableCell>Date</TableCell>
            <TableCell>Order</TableCell>
            <TableCell>Deliver To</TableCell>
            <TableCell>Payment Method</TableCell>
            <TableCell align="right">Price</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <TableRow key={row.id}>
              <TableCell>{row.date}</TableCell>
              <TableCell>{row.name}</TableCell>
              <TableCell>{row.shipTo}</TableCell>
              <TableCell>{row.paymentMethod}</TableCell>
              <TableCell align="right">{`INR ${row.amount}`}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      <Link color="primary" href="#" onClick={preventDefault} sx={{ mt: 3 }}>
        <h6>See more orders</h6>
      </Link>
    </React.Fragment>
  );
}