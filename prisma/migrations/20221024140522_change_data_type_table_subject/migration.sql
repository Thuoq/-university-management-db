-- AlterTable
ALTER TABLE "Subject" ALTER COLUMN "numberPrerequisiteCredits" DROP NOT NULL,
ALTER COLUMN "coefficient" SET DATA TYPE DECIMAL(65,30);
