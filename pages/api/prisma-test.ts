// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from "next";
import PrismaTypes, { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function prismaTest(
  req: NextApiRequest,
  res: NextApiResponse<PrismaTypes.User | null>
) {
  await prisma.user.create({
    data: {
      name: "テストuser1",
      email: "test@example.com",
    },
  });

  const prismaRes = await prisma.user.findUnique({
    where: {
      id: 1,
    },
  });

  console.log({ prismaRes });

  res.status(200).json(prismaRes);
}
