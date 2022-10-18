-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_facultyId_fkey";

-- AlterTable
ALTER TABLE "Employee" ALTER COLUMN "facultyId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_facultyId_fkey" FOREIGN KEY ("facultyId") REFERENCES "Faculty"("id") ON DELETE SET NULL ON UPDATE CASCADE;
