/*
  Warnings:

  - You are about to drop the column `faculityId` on the `Section` table. All the data in the column will be lost.
  - Added the required column `facultyId` to the `Section` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Section" DROP CONSTRAINT "Section_faculityId_fkey";

-- AlterTable
ALTER TABLE "Section" DROP COLUMN "faculityId",
ADD COLUMN     "facultyId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Section" ADD CONSTRAINT "Section_facultyId_fkey" FOREIGN KEY ("facultyId") REFERENCES "Faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
