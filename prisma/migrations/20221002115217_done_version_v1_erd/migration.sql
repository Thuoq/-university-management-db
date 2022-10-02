/*
  Warnings:

  - You are about to drop the column `screatedDatetime` on the `Subject` table. All the data in the column will be lost.
  - You are about to drop the `EducationProgram` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `KnowledgeBlock` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Position_Employee` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `numberOfCreditsRequirement` to the `Subject` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numberOfTeachingHours` to the `Subject` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EducationProgram" DROP CONSTRAINT "EducationProgram_majorId_fkey";

-- DropForeignKey
ALTER TABLE "KnowledgeBlock" DROP CONSTRAINT "KnowledgeBlock_educationProgramId_fkey";

-- DropForeignKey
ALTER TABLE "KnowledgeBlock" DROP CONSTRAINT "KnowledgeBlock_subjectId_fkey";

-- DropForeignKey
ALTER TABLE "Position_Employee" DROP CONSTRAINT "Position_Employee_employeeId_fkey";

-- DropForeignKey
ALTER TABLE "Position_Employee" DROP CONSTRAINT "Position_Employee_positionId_fkey";

-- AlterTable
ALTER TABLE "Score" ADD COLUMN     "status" INTEGER NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "className" TEXT;

-- AlterTable
ALTER TABLE "Subject" DROP COLUMN "screatedDatetime",
ADD COLUMN     "numberOfCreditsRequirement" INTEGER NOT NULL,
ADD COLUMN     "numberOfTeachingHours" INTEGER NOT NULL;

-- DropTable
DROP TABLE "EducationProgram";

-- DropTable
DROP TABLE "KnowledgeBlock";

-- DropTable
DROP TABLE "Position_Employee";

-- CreateTable
CREATE TABLE "PositionEmployee" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "positionId" INTEGER NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PositionEmployee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcademicYear" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AcademicYear_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KnowedgeBlock" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "KnowedgeBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingProgram" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "marjorId" INTEGER NOT NULL,
    "academicYearId" INTEGER NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TrainingProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingProgramContent" (
    "id" SERIAL NOT NULL,
    "subjectId" INTEGER NOT NULL,
    "trainingProgramId" INTEGER NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TrainingProgramContent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolSchedule" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "subjectId" INTEGER NOT NULL,
    "className" TEXT NOT NULL,
    "semesterId" INTEGER NOT NULL,
    "numberOfCredits" INTEGER NOT NULL,
    "room" TEXT NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SchoolSchedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RegisterSubject" (
    "id" SERIAL NOT NULL,
    "studentId" INTEGER NOT NULL,
    "subjectId" INTEGER NOT NULL,
    "semesterId" INTEGER NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RegisterSubject_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TrainingProgram_marjorId_key" ON "TrainingProgram"("marjorId");

-- CreateIndex
CREATE UNIQUE INDEX "SchoolSchedule_semesterId_key" ON "SchoolSchedule"("semesterId");

-- CreateIndex
CREATE UNIQUE INDEX "RegisterSubject_semesterId_key" ON "RegisterSubject"("semesterId");

-- AddForeignKey
ALTER TABLE "PositionEmployee" ADD CONSTRAINT "PositionEmployee_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PositionEmployee" ADD CONSTRAINT "PositionEmployee_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Position"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_marjorId_fkey" FOREIGN KEY ("marjorId") REFERENCES "Major"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_academicYearId_fkey" FOREIGN KEY ("academicYearId") REFERENCES "AcademicYear"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgramContent" ADD CONSTRAINT "TrainingProgramContent_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES "Subject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgramContent" ADD CONSTRAINT "TrainingProgramContent_trainingProgramId_fkey" FOREIGN KEY ("trainingProgramId") REFERENCES "TrainingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolSchedule" ADD CONSTRAINT "SchoolSchedule_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolSchedule" ADD CONSTRAINT "SchoolSchedule_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES "Subject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolSchedule" ADD CONSTRAINT "SchoolSchedule_semesterId_fkey" FOREIGN KEY ("semesterId") REFERENCES "Semester"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegisterSubject" ADD CONSTRAINT "RegisterSubject_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegisterSubject" ADD CONSTRAINT "RegisterSubject_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES "Subject"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegisterSubject" ADD CONSTRAINT "RegisterSubject_semesterId_fkey" FOREIGN KEY ("semesterId") REFERENCES "Semester"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
