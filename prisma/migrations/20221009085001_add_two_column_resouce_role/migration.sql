-- AlterTable
ALTER TABLE "ResouceRole" ADD COLUMN     "canApprove" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canImport" BOOLEAN NOT NULL DEFAULT false;
