// import { users } from '../generated/prisma';
// import prisma from '../config/prisma-client';
// import bcrypt from 'bcrypt'
// // import { jwtSign } from '../utils/jwt-sign';

// export async function registerService({
//   full_name,
//   email,
//   password,
//   phone_number,
//   referral_code,
//   referred_by_id,
// }: Pick<users, 'full_name' | 'email' | 'password' | 'phone_number' | 'referral_code' | 'referred_by_id'>) {
//   const hashedPassword = await bcrypt.hash(password, 10);
//   await prisma.users.create({
//     data: {
//       full_name,
//       email,
//       password: hashedPassword,
//       phone_number,
//       referral_code,
//       referred_by_id,
//     },
//   });
// }

// export async function loginService({
//   email,
//   password,
// }: Pick<users, 'email' | 'password'>) {
//   const findUser = await prisma.users.findFirst({
//     where: {
//       email: email,
//     },
//   });

//   if (!findUser) throw new Error('User not found');

//   const isComparePassword = await bcrypt.compare(password, findUser?.password);

//   if (!isComparePassword) throw new Error('Invalid password account');

//   const { password: _, ...safeUser } = findUser;

//   const token = jwtSign(
//     { userId: findUser?.id, role: findUser?.role },
//     process.env.JWT_SECRET_KEY!,
//     { expiresIn: '1d' }
//   );

//   return {
//     safeUser,
//     token,
//   };
// }
