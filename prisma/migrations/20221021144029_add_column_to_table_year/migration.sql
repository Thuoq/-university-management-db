/*
  Warnings:

  - You are about to drop the column `year` on the `AcademicYear` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_sectionId_fkey";

-- AlterTable
ALTER TABLE "AcademicYear" DROP COLUMN "year",
ADD COLUMN     "finishYear" TIMESTAMP(3),
ADD COLUMN     "startYear" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Employee" ALTER COLUMN "sectionId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES "Section"("id") ON DELETE SET NULL ON UPDATE CASCADE;
