--
-- PostgreSQL database dump
--

\restrict MdmXCEigRtw2qBZJJbXUKz0f3FPt3bbB1hHdEXEDWVCd4j1jp4SsnAbHfJQx82U

-- Dumped from database version 16.12
-- Dumped by pg_dump version 16.11

-- Started on 2026-03-20 05:17:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 81962)
-- Name: public; Type: SCHEMA; Schema: -; Owner: ose_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO ose_user;

--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: ose_user
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 958 (class 1247 OID 82034)
-- Name: ApprovalRequestType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."ApprovalRequestType" AS ENUM (
    'ADJUSTMENT',
    'BREAKAGE',
    'COUNT_ADJUSTMENT',
    'GRN_IMPORT',
    'STORE_REQUISITION',
    'STOCK_REPORT'
);


ALTER TYPE public."ApprovalRequestType" OWNER TO ose_user;

--
-- TOC entry 961 (class 1247 OID 82042)
-- Name: ApprovalStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."ApprovalStatus" AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED',
    'CANCELLED'
);


ALTER TYPE public."ApprovalStatus" OWNER TO ose_user;

--
-- TOC entry 964 (class 1247 OID 82052)
-- Name: ApprovalStepStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."ApprovalStepStatus" AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


ALTER TYPE public."ApprovalStepStatus" OWNER TO ose_user;

--
-- TOC entry 973 (class 1247 OID 82080)
-- Name: AuditAction; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."AuditAction" AS ENUM (
    'CREATE',
    'UPDATE',
    'DELETE',
    'POST',
    'VOID',
    'APPROVE',
    'REJECT',
    'IMPORT',
    'LOGIN',
    'LOGOUT',
    'SUBMIT',
    'CLOSE_PERIOD',
    'REOPEN_PERIOD',
    'LOCK_OB',
    'COUNT_APPROVE',
    'COUNT_REJECT'
);


ALTER TYPE public."AuditAction" OWNER TO ose_user;

--
-- TOC entry 970 (class 1247 OID 82070)
-- Name: CountSessionStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."CountSessionStatus" AS ENUM (
    'OPEN',
    'SUBMITTED',
    'APPROVED',
    'CLOSED'
);


ALTER TYPE public."CountSessionStatus" OWNER TO ose_user;

--
-- TOC entry 928 (class 1247 OID 89080)
-- Name: GetPassLineStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."GetPassLineStatus" AS ENUM (
    'PENDING',
    'OUT',
    'PARTIALLY_RETURNED',
    'RETURNED',
    'LOST'
);


ALTER TYPE public."GetPassLineStatus" OWNER TO ose_user;

--
-- TOC entry 925 (class 1247 OID 89058)
-- Name: GetPassStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."GetPassStatus" AS ENUM (
    'DRAFT',
    'PENDING_DEPT',
    'PENDING_FINANCE',
    'PENDING_SECURITY',
    'APPROVED',
    'OUT',
    'PARTIALLY_RETURNED',
    'RETURNED',
    'CLOSED',
    'REJECTED'
);


ALTER TYPE public."GetPassStatus" OWNER TO ose_user;

--
-- TOC entry 922 (class 1247 OID 89050)
-- Name: GetPassType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."GetPassType" AS ENUM (
    'TEMPORARY',
    'CATERING',
    'PERMANENT'
);


ALTER TYPE public."GetPassType" OWNER TO ose_user;

--
-- TOC entry 1042 (class 1247 OID 82562)
-- Name: GrnStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."GrnStatus" AS ENUM (
    'DRAFT',
    'VALIDATED',
    'PENDING_APPROVAL',
    'APPROVED',
    'POSTED',
    'REJECTED'
);


ALTER TYPE public."GrnStatus" OWNER TO ose_user;

--
-- TOC entry 967 (class 1247 OID 82060)
-- Name: ImportStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."ImportStatus" AS ENUM (
    'PENDING',
    'VALIDATED',
    'COMPLETED',
    'FAILED'
);


ALTER TYPE public."ImportStatus" OWNER TO ose_user;

--
-- TOC entry 1063 (class 1247 OID 82710)
-- Name: IssueStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."IssueStatus" AS ENUM (
    'DRAFT',
    'POSTED'
);


ALTER TYPE public."IssueStatus" OWNER TO ose_user;

--
-- TOC entry 955 (class 1247 OID 82026)
-- Name: LocationType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."LocationType" AS ENUM (
    'MAIN_STORE',
    'OUTLET_STORE',
    'DEPARTMENT'
);


ALTER TYPE public."LocationType" OWNER TO ose_user;

--
-- TOC entry 949 (class 1247 OID 82006)
-- Name: MovementStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."MovementStatus" AS ENUM (
    'DRAFT',
    'PENDING_APPROVAL',
    'POSTED',
    'VOID',
    'REJECTED'
);


ALTER TYPE public."MovementStatus" OWNER TO ose_user;

--
-- TOC entry 946 (class 1247 OID 81986)
-- Name: MovementType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."MovementType" AS ENUM (
    'OPENING_BALANCE',
    'RECEIVE',
    'ISSUE',
    'TRANSFER_OUT',
    'TRANSFER_IN',
    'RETURN',
    'ADJUSTMENT',
    'BREAKAGE',
    'COUNT_ADJUSTMENT',
    'TRANSFER',
    'LOAN_WRITE_OFF',
    'GET_PASS_OUT',
    'GET_PASS_RETURN'
);


ALTER TYPE public."MovementType" OWNER TO ose_user;

--
-- TOC entry 1087 (class 1247 OID 82943)
-- Name: PlanType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."PlanType" AS ENUM (
    'BASIC',
    'PRO',
    'ENTERPRISE',
    'CUSTOM'
);


ALTER TYPE public."PlanType" OWNER TO ose_user;

--
-- TOC entry 889 (class 1247 OID 83024)
-- Name: ReportType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."ReportType" AS ENUM (
    'SUMMARY',
    'DETAIL',
    'BREAKAGE',
    'OMC',
    'TRANSFERS',
    'AGING'
);


ALTER TYPE public."ReportType" OWNER TO ose_user;

--
-- TOC entry 1060 (class 1247 OID 82695)
-- Name: RequisitionStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."RequisitionStatus" AS ENUM (
    'DRAFT',
    'SUBMITTED',
    'APPROVED',
    'PARTIALLY_ISSUED',
    'FULLY_ISSUED',
    'CLOSED',
    'REJECTED'
);


ALTER TYPE public."RequisitionStatus" OWNER TO ose_user;

--
-- TOC entry 1090 (class 1247 OID 82952)
-- Name: SubscriptionStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."SubscriptionStatus" AS ENUM (
    'ACTIVE',
    'TRIAL',
    'EXPIRED',
    'SUSPENDED'
);


ALTER TYPE public."SubscriptionStatus" OWNER TO ose_user;

--
-- TOC entry 1078 (class 1247 OID 82846)
-- Name: TransferStatus; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."TransferStatus" AS ENUM (
    'DRAFT',
    'SUBMITTED',
    'APPROVED',
    'IN_TRANSIT',
    'RECEIVED',
    'CLOSED',
    'REJECTED'
);


ALTER TYPE public."TransferStatus" OWNER TO ose_user;

--
-- TOC entry 952 (class 1247 OID 82018)
-- Name: UnitType; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."UnitType" AS ENUM (
    'BASE',
    'PURCHASE',
    'ISSUE'
);


ALTER TYPE public."UnitType" OWNER TO ose_user;

--
-- TOC entry 943 (class 1247 OID 81973)
-- Name: UserRole; Type: TYPE; Schema: public; Owner: ose_user
--

CREATE TYPE public."UserRole" AS ENUM (
    'SUPER_ADMIN',
    'ADMIN',
    'STOREKEEPER',
    'DEPT_MANAGER',
    'COST_CONTROL',
    'FINANCE_MANAGER',
    'AUDITOR',
    'SECURITY_MANAGER'
);


ALTER TYPE public."UserRole" OWNER TO ose_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 81963)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO ose_user;

--
-- TOC entry 231 (class 1259 OID 82237)
-- Name: approval_requests; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.approval_requests (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "requestType" public."ApprovalRequestType" NOT NULL,
    status public."ApprovalStatus" DEFAULT 'PENDING'::public."ApprovalStatus" NOT NULL,
    "documentId" uuid,
    "currentStep" integer DEFAULT 0 NOT NULL,
    "totalSteps" integer NOT NULL,
    "createdBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "resolvedAt" timestamp(3) without time zone
);


ALTER TABLE public.approval_requests OWNER TO ose_user;

--
-- TOC entry 232 (class 1259 OID 82245)
-- Name: approval_steps; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.approval_steps (
    id uuid NOT NULL,
    "requestId" uuid NOT NULL,
    "stepNumber" integer NOT NULL,
    "requiredRole" public."UserRole" NOT NULL,
    status public."ApprovalStepStatus" DEFAULT 'PENDING'::public."ApprovalStepStatus" NOT NULL,
    "actedBy" uuid,
    "actedAt" timestamp(3) without time zone,
    comment text
);


ALTER TABLE public.approval_steps OWNER TO ose_user;

--
-- TOC entry 237 (class 1259 OID 82290)
-- Name: audit_log; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.audit_log (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "entityType" text NOT NULL,
    "entityId" text NOT NULL,
    action public."AuditAction" NOT NULL,
    "changedBy" uuid NOT NULL,
    "changedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "beforeValue" jsonb,
    "afterValue" jsonb,
    "ipAddress" text,
    "userAgent" text,
    note text
);


ALTER TABLE public.audit_log OWNER TO ose_user;

--
-- TOC entry 219 (class 1259 OID 82129)
-- Name: categories; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    name text NOT NULL,
    description text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "departmentId" uuid
);


ALTER TABLE public.categories OWNER TO ose_user;

--
-- TOC entry 252 (class 1259 OID 83090)
-- Name: departments; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.departments (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.departments OWNER TO ose_user;

--
-- TOC entry 260 (class 1259 OID 84795)
-- Name: doc_sequence; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.doc_sequence (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    prefix text NOT NULL,
    year integer NOT NULL,
    "lastSeq" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.doc_sequence OWNER TO ose_user;

--
-- TOC entry 259 (class 1259 OID 83161)
-- Name: generated_reports; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.generated_reports (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "reportType" public."ReportType" NOT NULL,
    "reportName" text NOT NULL,
    "departmentId" uuid,
    "startDate" timestamp(3) without time zone,
    "endDate" timestamp(3) without time zone,
    data jsonb NOT NULL,
    "generatedBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.generated_reports OWNER TO ose_user;

--
-- TOC entry 263 (class 1259 OID 89106)
-- Name: get_pass_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.get_pass_lines (
    id uuid NOT NULL,
    "getPassId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    qty numeric(15,4) NOT NULL,
    "qtyReturned" numeric(15,4) DEFAULT 0 NOT NULL,
    "unitCost" numeric(15,4) DEFAULT 0 NOT NULL,
    "conditionOut" text,
    status public."GetPassLineStatus" DEFAULT 'PENDING'::public."GetPassLineStatus" NOT NULL,
    notes text
);


ALTER TABLE public.get_pass_lines OWNER TO ose_user;

--
-- TOC entry 264 (class 1259 OID 89116)
-- Name: get_pass_returns; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.get_pass_returns (
    id uuid NOT NULL,
    "getPassLineId" uuid NOT NULL,
    "qtyReturned" numeric(15,4) NOT NULL,
    "conditionIn" text,
    "returnDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "registeredBy" uuid NOT NULL,
    "securityVerifiedBy" uuid,
    notes text
);


ALTER TABLE public.get_pass_returns OWNER TO ose_user;

--
-- TOC entry 262 (class 1259 OID 89097)
-- Name: get_passes; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.get_passes (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "passNo" text NOT NULL,
    "transferType" public."GetPassType" NOT NULL,
    "departmentId" uuid,
    "borrowingEntity" text NOT NULL,
    "expectedReturnDate" timestamp(3) without time zone,
    status public."GetPassStatus" DEFAULT 'DRAFT'::public."GetPassStatus" NOT NULL,
    "deptApprovedBy" uuid,
    "deptApprovedAt" timestamp(3) without time zone,
    "financeApprovedBy" uuid,
    "financeApprovedAt" timestamp(3) without time zone,
    "securityApprovedBy" uuid,
    "securityApprovedAt" timestamp(3) without time zone,
    "checkedOutBy" uuid,
    "checkedOutAt" timestamp(3) without time zone,
    "closedBy" uuid,
    "closedAt" timestamp(3) without time zone,
    reason text,
    notes text,
    "createdBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.get_passes OWNER TO ose_user;

--
-- TOC entry 238 (class 1259 OID 82575)
-- Name: grn_imports; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.grn_imports (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "grnNumber" text NOT NULL,
    "vendorId" uuid,
    "vendorNameSnapshot" text NOT NULL,
    "locationId" uuid NOT NULL,
    "receivingDate" timestamp(3) without time zone NOT NULL,
    "pdfAttachmentUrl" text NOT NULL,
    status public."GrnStatus" DEFAULT 'DRAFT'::public."GrnStatus" NOT NULL,
    "rejectionReason" text,
    notes text,
    "importedBy" uuid NOT NULL,
    "approvedBy" uuid,
    "rejectedBy" uuid,
    "postedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.grn_imports OWNER TO ose_user;

--
-- TOC entry 239 (class 1259 OID 82586)
-- Name: grn_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.grn_lines (
    id uuid NOT NULL,
    "grnImportId" uuid NOT NULL,
    "futurelogItemCode" text NOT NULL,
    "futurelogDescription" text NOT NULL,
    "futurelogUom" text NOT NULL,
    "orderedQty" numeric(15,4) NOT NULL,
    "receivedQty" numeric(15,4) NOT NULL,
    "unitPrice" numeric(15,4) NOT NULL,
    "internalItemId" uuid,
    "internalUomId" uuid,
    "conversionFactor" numeric(15,6) DEFAULT 1 NOT NULL,
    "qtyInBaseUnit" numeric(15,4) DEFAULT 0 NOT NULL,
    "isMapped" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.grn_lines OWNER TO ose_user;

--
-- TOC entry 234 (class 1259 OID 82266)
-- Name: import_rows; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.import_rows (
    id uuid NOT NULL,
    "sessionId" uuid NOT NULL,
    "rowNumber" integer NOT NULL,
    "rawData" jsonb NOT NULL,
    "mappedData" jsonb,
    status text DEFAULT 'PENDING'::text NOT NULL,
    errors jsonb,
    warnings jsonb
);


ALTER TABLE public.import_rows OWNER TO ose_user;

--
-- TOC entry 233 (class 1259 OID 82253)
-- Name: import_sessions; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.import_sessions (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    filename text NOT NULL,
    status public."ImportStatus" DEFAULT 'PENDING'::public."ImportStatus" NOT NULL,
    "totalRows" integer DEFAULT 0 NOT NULL,
    "validRows" integer DEFAULT 0 NOT NULL,
    "errorRows" integer DEFAULT 0 NOT NULL,
    "warningRows" integer DEFAULT 0 NOT NULL,
    "columnMap" jsonb,
    "importedBy" uuid NOT NULL,
    "importedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.import_sessions OWNER TO ose_user;

--
-- TOC entry 227 (class 1259 OID 82197)
-- Name: inventory_ledger; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.inventory_ledger (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "movementType" public."MovementType" NOT NULL,
    "qtyIn" numeric(15,4) DEFAULT 0 NOT NULL,
    "qtyOut" numeric(15,4) DEFAULT 0 NOT NULL,
    "unitCost" numeric(15,4) DEFAULT 0 NOT NULL,
    "totalValue" numeric(15,4) DEFAULT 0 NOT NULL,
    "referenceType" text,
    "referenceId" uuid,
    "referenceNo" text,
    "requiresApproval" boolean DEFAULT false NOT NULL,
    "approvalId" uuid,
    notes text,
    "createdBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.inventory_ledger OWNER TO ose_user;

--
-- TOC entry 240 (class 1259 OID 82597)
-- Name: item_mappings; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.item_mappings (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "futurelogItemCode" text NOT NULL,
    "futurelogItemName" text NOT NULL,
    "internalItemId" uuid NOT NULL,
    "createdBy" uuid NOT NULL,
    "updatedBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.item_mappings OWNER TO ose_user;

--
-- TOC entry 224 (class 1259 OID 82171)
-- Name: item_units; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.item_units (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "unitId" uuid NOT NULL,
    "unitType" public."UnitType" NOT NULL,
    "conversionRate" numeric(15,6) DEFAULT 1 NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.item_units OWNER TO ose_user;

--
-- TOC entry 226 (class 1259 OID 82187)
-- Name: items; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.items (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    name text NOT NULL,
    description text,
    "categoryId" uuid,
    "subcategoryId" uuid,
    "supplierId" uuid,
    barcode text,
    "unitPrice" numeric(15,4) DEFAULT 0 NOT NULL,
    "imageUrl" text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "defaultStoreId" uuid,
    "departmentId" uuid,
    "reorderPoint" integer DEFAULT 0 NOT NULL,
    "reorderQty" integer DEFAULT 0 NOT NULL,
    code text
);


ALTER TABLE public.items OWNER TO ose_user;

--
-- TOC entry 261 (class 1259 OID 87980)
-- Name: location_categories; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.location_categories (
    id uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "categoryId" uuid NOT NULL
);


ALTER TABLE public.location_categories OWNER TO ose_user;

--
-- TOC entry 222 (class 1259 OID 82157)
-- Name: location_users; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.location_users (
    id uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "userId" uuid NOT NULL
);


ALTER TABLE public.location_users OWNER TO ose_user;

--
-- TOC entry 221 (class 1259 OID 82147)
-- Name: locations; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.locations (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    name text NOT NULL,
    type public."LocationType" DEFAULT 'MAIN_STORE'::public."LocationType" NOT NULL,
    description text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "departmentId" uuid
);


ALTER TABLE public.locations OWNER TO ose_user;

--
-- TOC entry 229 (class 1259 OID 82218)
-- Name: movement_documents; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.movement_documents (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "documentNo" text NOT NULL,
    "movementType" public."MovementType" NOT NULL,
    status public."MovementStatus" DEFAULT 'DRAFT'::public."MovementStatus" NOT NULL,
    "sourceLocationId" uuid,
    "destLocationId" uuid,
    "documentDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "supplierId" uuid,
    department text,
    reason text,
    notes text,
    "attachmentUrl" text,
    "createdBy" uuid NOT NULL,
    "postedAt" timestamp(3) without time zone,
    "voidedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.movement_documents OWNER TO ose_user;

--
-- TOC entry 230 (class 1259 OID 82228)
-- Name: movement_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.movement_lines (
    id uuid NOT NULL,
    "documentId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "unitId" uuid,
    "qtyRequested" numeric(15,4) NOT NULL,
    "qtyInBaseUnit" numeric(15,4) NOT NULL,
    "unitCost" numeric(15,4) DEFAULT 0 NOT NULL,
    "totalValue" numeric(15,4) DEFAULT 0 NOT NULL,
    notes text
);


ALTER TABLE public.movement_lines OWNER TO ose_user;

--
-- TOC entry 253 (class 1259 OID 83099)
-- Name: period_closes; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.period_closes (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    year integer NOT NULL,
    month integer,
    status text DEFAULT 'OPEN'::text NOT NULL,
    "closedAt" timestamp(3) without time zone,
    "closedBy" uuid,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.period_closes OWNER TO ose_user;

--
-- TOC entry 254 (class 1259 OID 83108)
-- Name: period_snapshots; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.period_snapshots (
    id uuid NOT NULL,
    "periodCloseId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "closingQty" numeric(15,4) NOT NULL,
    "closingValue" numeric(15,4) NOT NULL,
    "wacUnitCost" numeric(15,4) NOT NULL
);


ALTER TABLE public.period_snapshots OWNER TO ose_user;

--
-- TOC entry 218 (class 1259 OID 82121)
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.refresh_tokens (
    id uuid NOT NULL,
    "userId" uuid NOT NULL,
    token text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "revokedAt" timestamp(3) without time zone,
    "ipAddress" text,
    "userAgent" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO ose_user;

--
-- TOC entry 257 (class 1259 OID 83141)
-- Name: saved_stock_report_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.saved_stock_report_lines (
    id uuid NOT NULL,
    "reportId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "openingQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "openingValue" numeric(15,4) DEFAULT 0 NOT NULL,
    "inwardQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "inwardValue" numeric(15,4) DEFAULT 0 NOT NULL,
    "outwardQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "outwardValue" numeric(15,4) DEFAULT 0 NOT NULL,
    "closingQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "closingValue" numeric(15,4) DEFAULT 0 NOT NULL,
    "outOnPassQty" numeric(15,4) DEFAULT 0 NOT NULL,
    breakages numeric(15,4) DEFAULT 0 NOT NULL,
    "grnQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "grnValue" numeric(15,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public.saved_stock_report_lines OWNER TO ose_user;

--
-- TOC entry 258 (class 1259 OID 83154)
-- Name: saved_stock_report_location_qtys; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.saved_stock_report_location_qtys (
    id uuid NOT NULL,
    "lineId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "bookQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "countedQty" numeric(15,4),
    "varianceQty" numeric(15,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public.saved_stock_report_location_qtys OWNER TO ose_user;

--
-- TOC entry 256 (class 1259 OID 83130)
-- Name: saved_stock_reports; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.saved_stock_reports (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "reportNo" text NOT NULL,
    "locationId" uuid NOT NULL,
    status public."MovementStatus" DEFAULT 'DRAFT'::public."MovementStatus" NOT NULL,
    "dateGenerated" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "totalValue" numeric(15,4) DEFAULT 0 NOT NULL,
    notes text,
    "createdBy" uuid NOT NULL,
    "approvalRequestId" uuid,
    "postedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.saved_stock_reports OWNER TO ose_user;

--
-- TOC entry 228 (class 1259 OID 82210)
-- Name: stock_balances; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.stock_balances (
    "tenantId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "qtyOnHand" numeric(15,4) DEFAULT 0 NOT NULL,
    "wacUnitCost" numeric(15,4) DEFAULT 0 NOT NULL,
    "lastUpdated" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "maxQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "minQty" numeric(15,4) DEFAULT 0 NOT NULL,
    "reorderPoint" numeric(15,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public.stock_balances OWNER TO ose_user;

--
-- TOC entry 236 (class 1259 OID 82283)
-- Name: stock_count_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.stock_count_lines (
    id uuid NOT NULL,
    "sessionId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "bookQty" numeric(15,4) NOT NULL,
    "countedQty" numeric(15,4),
    "varianceQty" numeric(15,4),
    "wacUnitCost" numeric(15,4) NOT NULL,
    "varianceValue" numeric(15,4),
    notes text,
    "qtyOnLoan" numeric(15,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public.stock_count_lines OWNER TO ose_user;

--
-- TOC entry 235 (class 1259 OID 82274)
-- Name: stock_count_sessions; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.stock_count_sessions (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "locationId" uuid NOT NULL,
    "sessionNo" text NOT NULL,
    "countDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    notes text,
    "createdBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "approvalRequestId" uuid,
    "movementDocumentId" uuid,
    "postedAt" timestamp(3) without time zone,
    "snapshotAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    status public."MovementStatus" DEFAULT 'DRAFT'::public."MovementStatus" NOT NULL
);


ALTER TABLE public.stock_count_sessions OWNER TO ose_user;

--
-- TOC entry 246 (class 1259 OID 82815)
-- Name: store_issue_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.store_issue_lines (
    id uuid NOT NULL,
    "issueId" uuid NOT NULL,
    "requisitionLineId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "uomId" uuid NOT NULL,
    "issuedQty" numeric(15,4) NOT NULL,
    "unitCost" numeric(15,4) DEFAULT 0 NOT NULL,
    "totalValue" numeric(15,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public.store_issue_lines OWNER TO ose_user;

--
-- TOC entry 245 (class 1259 OID 82784)
-- Name: store_issues; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.store_issues (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "issueNo" text NOT NULL,
    "requisitionId" uuid NOT NULL,
    "issueDate" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "issuedBy" uuid NOT NULL,
    status public."IssueStatus" DEFAULT 'DRAFT'::public."IssueStatus" NOT NULL,
    notes text,
    "attachmentUrl" text,
    "postedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.store_issues OWNER TO ose_user;

--
-- TOC entry 244 (class 1259 OID 82759)
-- Name: store_requisition_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.store_requisition_lines (
    id uuid NOT NULL,
    "requisitionId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "uomId" uuid NOT NULL,
    "requestedQty" numeric(15,4) NOT NULL,
    "totalIssuedQty" numeric(15,4) DEFAULT 0 NOT NULL,
    notes text
);


ALTER TABLE public.store_requisition_lines OWNER TO ose_user;

--
-- TOC entry 243 (class 1259 OID 82717)
-- Name: store_requisitions; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.store_requisitions (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "requisitionNo" text NOT NULL,
    "departmentName" text NOT NULL,
    "locationId" uuid NOT NULL,
    "requestedBy" uuid NOT NULL,
    "approvedBy" uuid,
    "rejectedBy" uuid,
    "requestDate" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "requiredBy" timestamp(3) without time zone,
    status public."RequisitionStatus" DEFAULT 'DRAFT'::public."RequisitionStatus" NOT NULL,
    remarks text,
    "rejectionReason" text,
    "approvedAt" timestamp(3) without time zone,
    "fullyIssuedAt" timestamp(3) without time zone,
    "closedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.store_requisitions OWNER TO ose_user;

--
-- TOC entry 248 (class 1259 OID 82914)
-- Name: store_transfer_lines; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.store_transfer_lines (
    id uuid NOT NULL,
    "transferId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "uomId" uuid NOT NULL,
    "requestedQty" numeric(15,4) NOT NULL,
    "receivedQty" numeric(15,4),
    "unitCost" numeric(15,4) DEFAULT 0 NOT NULL,
    "totalValue" numeric(15,4) DEFAULT 0 NOT NULL,
    notes text
);


ALTER TABLE public.store_transfer_lines OWNER TO ose_user;

--
-- TOC entry 247 (class 1259 OID 82861)
-- Name: store_transfers; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.store_transfers (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "transferNo" text NOT NULL,
    "sourceLocationId" uuid NOT NULL,
    "destLocationId" uuid NOT NULL,
    "requestedBy" uuid NOT NULL,
    "approvedBy" uuid,
    "rejectedBy" uuid,
    "receivedBy" uuid,
    "transferDate" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "requiredBy" timestamp(3) without time zone,
    status public."TransferStatus" DEFAULT 'DRAFT'::public."TransferStatus" NOT NULL,
    reason text,
    "rejectionReason" text,
    notes text,
    "approvedAt" timestamp(3) without time zone,
    "dispatchedAt" timestamp(3) without time zone,
    "receivedAt" timestamp(3) without time zone,
    "closedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.store_transfers OWNER TO ose_user;

--
-- TOC entry 220 (class 1259 OID 82138)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.subcategories (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "categoryId" uuid NOT NULL,
    name text NOT NULL,
    description text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.subcategories OWNER TO ose_user;

--
-- TOC entry 249 (class 1259 OID 82961)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.subscriptions (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "planType" public."PlanType" DEFAULT 'BASIC'::public."PlanType" NOT NULL,
    status public."SubscriptionStatus" DEFAULT 'TRIAL'::public."SubscriptionStatus" NOT NULL,
    "startDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endDate" timestamp(3) without time zone,
    "trialEndsAt" timestamp(3) without time zone,
    "maxUsers" integer DEFAULT 5 NOT NULL,
    "maxStores" integer DEFAULT 2 NOT NULL,
    "maxDepartments" integer DEFAULT 3 NOT NULL,
    "maxMonthlyMovements" integer DEFAULT 500 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO ose_user;

--
-- TOC entry 251 (class 1259 OID 82986)
-- Name: super_admin_logs; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.super_admin_logs (
    id uuid NOT NULL,
    "adminUserId" uuid NOT NULL,
    action text NOT NULL,
    "targetTenantId" uuid,
    details jsonb,
    "ipAddress" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.super_admin_logs OWNER TO ose_user;

--
-- TOC entry 225 (class 1259 OID 82178)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.suppliers (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    name text NOT NULL,
    "contactPerson" text,
    phone text,
    email text,
    address text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.suppliers OWNER TO ose_user;

--
-- TOC entry 255 (class 1259 OID 83113)
-- Name: tenant_settings; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.tenant_settings (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    "updatedBy" uuid,
    reason text,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.tenant_settings OWNER TO ose_user;

--
-- TOC entry 250 (class 1259 OID 82975)
-- Name: tenant_usage; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.tenant_usage (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "totalUsers" integer DEFAULT 0 NOT NULL,
    "totalActiveStores" integer DEFAULT 0 NOT NULL,
    "movementsThisMonth" integer DEFAULT 0 NOT NULL,
    "movementsResetAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "storageBytes" bigint DEFAULT 0 NOT NULL,
    "lastActivityAt" timestamp(3) without time zone,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.tenant_usage OWNER TO ose_user;

--
-- TOC entry 216 (class 1259 OID 82101)
-- Name: tenants; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.tenants (
    id uuid NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    "subscriptionTier" text DEFAULT 'starter'::text NOT NULL,
    "logoUrl" text,
    address text,
    phone text,
    email text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "licenseEndDate" timestamp(3) without time zone,
    "licenseStartDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "maxUsers" integer DEFAULT 10 NOT NULL,
    "planType" public."PlanType" DEFAULT 'BASIC'::public."PlanType" NOT NULL,
    "subStatus" public."SubscriptionStatus" DEFAULT 'TRIAL'::public."SubscriptionStatus" NOT NULL
);


ALTER TABLE public.tenants OWNER TO ose_user;

--
-- TOC entry 223 (class 1259 OID 82162)
-- Name: units; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.units (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    name text NOT NULL,
    abbreviation text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.units OWNER TO ose_user;

--
-- TOC entry 241 (class 1259 OID 82607)
-- Name: uom_mappings; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.uom_mappings (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "futurelogUom" text NOT NULL,
    "internalUomId" uuid NOT NULL,
    "conversionFactor" numeric(15,6) DEFAULT 1 NOT NULL,
    "createdBy" uuid NOT NULL,
    "updatedBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.uom_mappings OWNER TO ose_user;

--
-- TOC entry 217 (class 1259 OID 82111)
-- Name: users; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    "tenantId" uuid,
    email text NOT NULL,
    "passwordHash" text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    role public."UserRole" DEFAULT 'STOREKEEPER'::public."UserRole" NOT NULL,
    department text,
    phone text,
    "isActive" boolean DEFAULT true NOT NULL,
    "lastLoginAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO ose_user;

--
-- TOC entry 242 (class 1259 OID 82618)
-- Name: vendor_mappings; Type: TABLE; Schema: public; Owner: ose_user
--

CREATE TABLE public.vendor_mappings (
    id uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "futurelogVendorName" text NOT NULL,
    "internalSupplierId" uuid NOT NULL,
    "createdBy" uuid NOT NULL,
    "updatedBy" uuid NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.vendor_mappings OWNER TO ose_user;

--
-- TOC entry 4146 (class 0 OID 81963)
-- Dependencies: 215
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d4a310a0-ccba-4d53-b70f-387c39cb600b	58a9bd8d9a878cd821b68b00a13981ccc7853457a93df8be0413f1a7e811cd85	\N	20260226142731_add_transfer_enum	A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20260226142731_add_transfer_enum\n\nDatabase error code: 42710\n\nDatabase error:\nERROR: enum label "TRANSFER" already exists\n\nDbError { severity: "ERROR", parsed_severity: Some(Error), code: SqlState(E42710), message: "enum label \\"TRANSFER\\" already exists", detail: None, hint: None, position: None, where_: None, schema: None, table: None, column: None, datatype: None, constraint: None, file: Some("pg_enum.c"), line: Some(293), routine: Some("AddEnumLabel") }\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name="20260226142731_add_transfer_enum"\n             at schema-engine\\connectors\\sql-schema-connector\\src\\apply_migration.rs:106\n   1: schema_core::commands::apply_migrations::Applying migration\n           with migration_name="20260226142731_add_transfer_enum"\n             at schema-engine\\core\\src\\commands\\apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine\\core\\src\\state.rs:226	2026-03-18 15:42:57.688054+00	2026-03-18 15:42:38.931633+00	0
afa551de-76af-416a-aaa4-8373bc6f2465	aba6ee6b6a7d66115603d96353802e705441f8dbc873b67e99f8ffc5e7487058	\N	20260225222427_init_m04	A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20260225222427_init_m04\n\nDatabase error code: 42710\n\nDatabase error:\nERROR: type "UserRole" already exists\n\nDbError { severity: "ERROR", parsed_severity: Some(Error), code: SqlState(E42710), message: "type \\"UserRole\\" already exists", detail: None, hint: None, position: None, where_: None, schema: None, table: None, column: None, datatype: None, constraint: None, file: Some("typecmds.c"), line: Some(1167), routine: Some("DefineEnum") }\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name="20260225222427_init_m04"\n             at schema-engine\\connectors\\sql-schema-connector\\src\\apply_migration.rs:106\n   1: schema_core::commands::apply_migrations::Applying migration\n           with migration_name="20260225222427_init_m04"\n             at schema-engine\\core\\src\\commands\\apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine\\core\\src\\state.rs:226	2026-03-18 15:41:54.258345+00	2026-03-15 18:58:10.814234+00	0
9a24fb33-a0ea-44f0-a808-979b61772ee2	58a9bd8d9a878cd821b68b00a13981ccc7853457a93df8be0413f1a7e811cd85	2026-03-18 15:42:57.692184+00	20260226142731_add_transfer_enum		\N	2026-03-18 15:42:57.692184+00	0
4aa031a7-6dfa-42ae-b0f3-1c52d95acdb1	aba6ee6b6a7d66115603d96353802e705441f8dbc873b67e99f8ffc5e7487058	\N	20260225222427_init_m04	A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20260225222427_init_m04\n\nDatabase error code: 42710\n\nDatabase error:\nERROR: type "UserRole" already exists\n\nDbError { severity: "ERROR", parsed_severity: Some(Error), code: SqlState(E42710), message: "type \\"UserRole\\" already exists", detail: None, hint: None, position: None, where_: None, schema: None, table: None, column: None, datatype: None, constraint: None, file: Some("typecmds.c"), line: Some(1167), routine: Some("DefineEnum") }\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name="20260225222427_init_m04"\n             at schema-engine\\connectors\\sql-schema-connector\\src\\apply_migration.rs:106\n   1: schema_core::commands::apply_migrations::Applying migration\n           with migration_name="20260225222427_init_m04"\n             at schema-engine\\core\\src\\commands\\apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine\\core\\src\\state.rs:226	2026-03-18 15:42:23.839658+00	2026-03-18 15:42:10.68723+00	0
7f119a11-36a6-40a4-b6af-d1ebac33bce8	aba6ee6b6a7d66115603d96353802e705441f8dbc873b67e99f8ffc5e7487058	2026-03-18 15:42:23.843651+00	20260225222427_init_m04		\N	2026-03-18 15:42:23.843651+00	0
bf35bd36-70c6-4e75-99c3-b845b8059f44	070c27fbb0173a4a2af64a618212e2fbb0b31a81769640f1eb906a368217685e	2026-03-18 15:42:58.775336+00	20260228013700_phase4_grn_import_gate		\N	2026-03-18 15:42:58.775336+00	0
b023b5d0-871a-4d0a-a353-a6a89797c2e5	2546abd919d3b2427357fd66d5ee7029f46ee44d40650fcd008f2a529a4dc009	2026-03-18 15:42:59.876131+00	20260228020000_phase5_store_requisition_issue		\N	2026-03-18 15:42:59.876131+00	0
3763fcf1-45e1-42ae-b07d-c1666abeec06	b10c4955671b37ae6cd05a88f6b0b8459cc00392b0ebf169e7275712619065f1	2026-03-18 15:43:00.930125+00	20260228030000_phase6_transfers_breakage_subtype		\N	2026-03-18 15:43:00.930125+00	0
8e4725f6-36a9-4c63-ad36-128924568feb	3a2c5889f0d1164567794414ccff80cf74891f3744a349589d78cd9b35e8178e	2026-03-18 15:43:02.103562+00	20260228134000_saas_phase1_subscription_usage_admin		\N	2026-03-18 15:43:02.103562+00	0
4cee88c5-ae16-4f47-a281-b34a3a6c3dbb	3559577efc258f26cb68369ffbec0a482563e0e65187f07e31dbe557336f4359	2026-03-18 15:43:03.184527+00	20260315220000_add_security_manager_get_pass_approval		\N	2026-03-18 15:43:03.184527+00	0
\.


--
-- TOC entry 4162 (class 0 OID 82237)
-- Dependencies: 231
-- Data for Name: approval_requests; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.approval_requests (id, "tenantId", "requestType", status, "documentId", "currentStep", "totalSteps", "createdBy", "createdAt", "resolvedAt") FROM stdin;
76ec6628-8cab-4886-9dbf-ddcd50fabcec	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	APPROVED	928dc673-951f-4031-b24b-bccb29fdf86e	3	3	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:15:53.226	2026-03-19 16:16:02.617
1b748ae7-fa13-4576-b72c-0879b18e80c6	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	STOCK_REPORT	APPROVED	\N	1	1	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:16:34.988	\N
178ea66f-70b2-461f-839a-4cfeb780ae57	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	STOCK_REPORT	APPROVED	\N	1	1	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:26:05.477	\N
77ea30dc-cebb-4e54-8507-64f91e3dac81	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	APPROVED	dc48f334-2946-41a7-ad25-d801e400ab6c	3	3	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:32:54.246	2026-03-18 22:34:49.043
aa5be28f-5e61-49bf-9e32-284dbd4930c1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	STOCK_REPORT	APPROVED	\N	1	1	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:38:07.56	\N
6bebbef7-71e4-4bd9-a548-f7a12ffd973a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	STOCK_REPORT	APPROVED	\N	1	1	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:39:56.778	\N
a2330b78-dde8-4f4f-8ac2-6023239b7412	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	STOCK_REPORT	APPROVED	\N	1	1	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:01:11.576	\N
81724df7-269a-4f12-be04-41eb78688907	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	STOCK_REPORT	APPROVED	\N	1	1	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:12:31.317	\N
\.


--
-- TOC entry 4163 (class 0 OID 82245)
-- Dependencies: 232
-- Data for Name: approval_steps; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.approval_steps (id, "requestId", "stepNumber", "requiredRole", status, "actedBy", "actedAt", comment) FROM stdin;
8c7d36dc-ca0b-4945-a1a3-ce4b36ba903f	77ea30dc-cebb-4e54-8507-64f91e3dac81	1	DEPT_MANAGER	APPROVED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:43.063	\N
111f85d7-a32b-41b2-9a76-b149c0f96116	77ea30dc-cebb-4e54-8507-64f91e3dac81	2	COST_CONTROL	APPROVED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:46.105	\N
8c07ac27-7218-44d3-b8c7-b944cca397ca	77ea30dc-cebb-4e54-8507-64f91e3dac81	3	FINANCE_MANAGER	APPROVED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:49.043	\N
a7d276fe-91f5-42a3-abc1-a286a92f5e7e	aa5be28f-5e61-49bf-9e32-284dbd4930c1	1	FINANCE_MANAGER	PENDING	\N	\N	\N
2de15848-3eef-4ee2-b6bd-a10bf479e71f	6bebbef7-71e4-4bd9-a548-f7a12ffd973a	1	FINANCE_MANAGER	PENDING	\N	\N	\N
e1128a60-3fab-4bcb-a00d-9250dafb52b8	a2330b78-dde8-4f4f-8ac2-6023239b7412	1	FINANCE_MANAGER	PENDING	\N	\N	\N
6f8bf1b1-0c1b-495f-bcb6-c152e3fc21f0	81724df7-269a-4f12-be04-41eb78688907	1	FINANCE_MANAGER	PENDING	\N	\N	\N
9768dc2c-a400-4ad4-add9-3a9b2acb69c8	76ec6628-8cab-4886-9dbf-ddcd50fabcec	1	DEPT_MANAGER	APPROVED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:15:58.032	\N
7e3bc803-e53e-4a8e-914e-2f989cde82c6	76ec6628-8cab-4886-9dbf-ddcd50fabcec	2	COST_CONTROL	APPROVED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:16:00.138	\N
9ffc146d-54ec-42f2-b29d-8d57070eed06	76ec6628-8cab-4886-9dbf-ddcd50fabcec	3	FINANCE_MANAGER	APPROVED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:16:02.617	\N
9f6c0b39-47ca-41c0-b295-42fcdacf1930	1b748ae7-fa13-4576-b72c-0879b18e80c6	1	FINANCE_MANAGER	PENDING	\N	\N	\N
30621318-10b4-4cad-a1ee-d42357cafd2c	178ea66f-70b2-461f-839a-4cfeb780ae57	1	FINANCE_MANAGER	PENDING	\N	\N	\N
\.


--
-- TOC entry 4168 (class 0 OID 82290)
-- Dependencies: 237
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.audit_log (id, "tenantId", "entityType", "entityId", action, "changedBy", "changedAt", "beforeValue", "afterValue", "ipAddress", "userAgent", note) FROM stdin;
2cd4f3d5-3c25-4f53-a918-907998216eae	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	e75494d4-285e-4909-a498-b69e5e949c57	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:52.513	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0011)
9300e33d-f03e-4da9-89c2-534246c4e50d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	c5d66da2-b9a1-4e4a-b109-09017a43317a	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:52.643	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0012)
7ed724ed-ba7f-4608-9670-a2af7baa2e76	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	40e1a666-ff60-4079-8655-afe41d815259	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:52.77	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0013)
43602712-f2da-405e-a26e-1ba450d7a511	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	e9982cfb-d791-4883-9a34-493b45e7346d	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:52.888	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0014)
c7bfa1b7-aa18-447c-9328-5d8589df3a0b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	b2132ceb-8baa-4b9d-8914-a7910cbd1088	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:53.018	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0015)
fdd9de31-fc23-4aa5-a8ad-5b5b884af96c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	004ec09d-b278-4569-9cea-b94e36176423	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:53.147	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0016)
7496647c-fb48-410f-bd56-e2cb7dbf0bd9	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	5cf46bcb-947a-49be-9a8e-521ecc09e83a	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:53.276	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0017)
dd6d1818-6474-4171-83aa-a95ad1143159	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	198a4d65-64d8-4bd2-b3c8-2689d4daff61	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:53.444	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0018)
09b3b90e-9b62-48c4-9756-d903631b5a1f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	12cc4536-d0da-456a-bc7f-544e7a33ac8a	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:53.601	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0019)
5f8ef8e1-2d5f-43b6-989c-ae0757a3a2a7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	4c28607a-cccc-4897-ad30-74f5b7435d1f	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:55:53.749	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0020)
4bd4fc2c-bec7-4b97-80be-78cab150190b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	086a90fb-4143-4664-89e3-e426caa4c45e	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:21.91	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0021)
4edf54fa-3093-4000-9b9b-3f5ae5403b08	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	3554a8b8-cad0-4611-bacf-a5ee12fbdc28	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.008	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0022)
792432ee-839d-4358-ad58-44d41a601ec1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	22a63d82-beba-4264-9410-c7579300dab9	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.106	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0023)
16547342-3807-4142-b5b6-d5fff02da453	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	df2aa80e-af88-47d1-96ca-d8bafe3fec56	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.202	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0024)
2b80a05a-7c26-4806-81b5-a91b89225c0c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	1cf38779-9309-4692-85b1-3cda5f9d092a	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.302	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0025)
a42ec6c1-807a-4802-bbe1-34dee21250df	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	1cbc544e-737f-428d-9589-e352d7aa7065	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.417	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0026)
dc35fbe4-72ac-42cc-8eaa-867225cc610f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	67369257-ecb8-478c-a365-9ab668360196	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.542	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0027)
4b655bbc-fcf4-401a-888c-4da32ff7adb4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	6e8e1258-5c67-4254-9524-f133ddf892e0	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.716	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0028)
375961dd-41bb-41a7-8b36-f4bb79086232	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	bb63a3e0-66ea-4cf1-b539-819d84dc688e	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:22.883	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0029)
d7130abf-207d-4696-ad94-edc1479d2195	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	5c38665d-feaa-4431-ab04-c9715c776ec0	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 17:56:23.037	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0030)
2bbbe964-3949-4634-96f4-38f19ada81a3	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	USER	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	LOGIN	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:25:13.408	\N	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	\N
0bc634c3-56ae-445a-b90b-36f8fe566233	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	79d5b5a7-74bb-4ade-9126-7dc0bd88a839	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:48.322	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0031)
4accaf3c-0cd1-4025-8a24-61f2b9ce1aa3	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	11fe25fa-49bb-41fb-95c9-6969006bffa0	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:48.732	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0032)
5e812b33-e34f-488f-8a07-76ecf6905e5f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	08ca0c26-6eab-43cb-b5bf-0864203b3846	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:49.09	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0033)
9901cce9-614a-4df2-b4fe-46317490a352	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	546007e3-746c-4233-adbc-6aea65031dde	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:49.536	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0034)
070a0925-49a3-4d1a-b115-d523c6bff3f4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	fe53c2e3-6b42-4664-949a-aec82e72b476	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:49.895	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0035)
2896c1ad-feaa-4c5a-bdb4-d67c1d27973e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	563e6bd4-8810-4e42-91f4-e14632fa48c8	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:50.221	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0036)
2607dcea-d9b7-4231-b764-f07ca41cc59f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	83ab3a78-0436-4f49-83e5-edd31415890d	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:50.47	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0037)
899a58e3-4f5f-475b-bdd5-e6e02d0b0333	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	393deaa7-fcb5-4eeb-8c95-ae3f7077250b	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:51.112	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0038)
a3e64109-b0dc-462e-af3c-2a0eedc81c69	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	a5c0a894-751d-4db5-887c-ad38ee16a9e0	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:51.8	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0039)
c2e9f17c-e6d8-4af1-94fa-8a07d59d35a8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	aeedbdb1-cf0a-4216-9fc6-cdc39a00ebb5	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:37:52.553	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0040)
697c0c49-e7ac-4939-bbbf-806b3a5e71f4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	eaac3f8a-c2b5-4a99-bf4e-60ce8971a7db	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:23.08	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0041)
60eb39b9-7a1e-4eee-a413-2bed981d3dce	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	4454f4a3-8468-44b7-98b8-fe49d851c2b1	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:23.238	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0042)
c173c2cb-e4d1-4727-8a88-6d57eeb41d31	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	9c64a2b3-ada4-4431-ad48-73e3809470e3	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:23.419	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0043)
15fef623-fc97-44da-a00a-6c605475ec72	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	1485c368-a7d1-4d6e-ac5e-449ecee07357	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:23.619	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0044)
0a0c53cd-f45c-456c-996c-decde2b84c96	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	03d6c873-3c75-46b6-8e44-a2ef024bbd86	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:23.82	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0045)
05a273f2-8d8d-4347-acb2-6412e6b07651	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	102abc40-323d-43d5-94af-0f597cc23e69	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:24.045	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0046)
fb2d99e9-5d50-4baa-bbbd-00ba93f9edc4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	18ce5698-152a-4d25-ae2d-f4b8b1b01694	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:24.278	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0047)
e24214eb-dfaf-4cc6-b98e-a141b9c7b49a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	31d3c548-e7bd-4a5b-adab-d72a5aa8b1a0	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:24.664	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0048)
c39d30b0-eac6-495a-b417-0fdb1c0d41fe	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	494d1ffb-bed2-48e6-a898-4420ab0d9ed1	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:25.051	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0049)
e69016c2-4bf7-412e-ad3e-51978644a803	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	1b8eada8-926e-46af-ac81-08e36843ee2f	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-16 19:41:25.5	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0050)
1c3d32cb-6132-45fd-99f7-88305c8d1cff	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	0d8144ba-2f6c-41b6-8d99-c6c223cf8edd	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:12:54.405	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0010)
40ff20d1-d88a-4c89-8150-0284616bac7d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	bdb88af5-d60b-48b3-a05c-7c4f6cbf67ff	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:13:09.584	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0009)
1a62a9e9-e46b-4ed9-a236-2f369bf24cd5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	31f2455b-3285-4993-a119-fc78a1388e18	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:13:20.732	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0008)
e0313133-2d46-453e-92e7-7d1317495c2a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	4fed7fca-8b8e-4be0-a893-6ae636e20d75	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:13:32.394	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0007)
251cee46-fa37-4763-9e15-4d76ffe75f9c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	8e80eca8-9512-454e-bdb1-c09756df7557	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:13:41.214	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0006)
8974888e-64ea-406a-bfc2-a8f71edc2271	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	d54939c3-9b15-447e-bf3a-cc01de787fba	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:13:49.013	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0005)
63c4cea8-0b82-4652-bd81-2bb49ae50bc3	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	53bab277-f009-4776-ba78-2461ac1e66b9	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:14:01.876	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0004)
fb2309c0-d65e-480c-a8cc-a17e66328a6b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	405b0dda-2877-4b1c-9755-db949ea7a7a6	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:14:08.498	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0003)
4a725ff2-616c-48dc-bafa-29a7d55fde3b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	ac8f5e61-d2ec-4f82-be1b-8f11181acc30	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:14:15.96	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0002)
8d49700a-e2fd-44e6-b2f9-3049c755dcee	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	ca085030-adb3-4e63-bac6-b4e0ae8875e1	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-17 23:14:24.183	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0001)
88cc7e4c-682e-4dc6-bbe2-bf845774973f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	7a0d65cd-266f-4072-8936-89861d2304a4	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.063	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0001)
72d915a9-86df-4520-9461-ab06527d0fb0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	8ebb499d-b08b-4933-9c20-039c1914eda2	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.209	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0002)
0317dc7e-6302-4532-a356-084336dc2d1b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	9952587d-d5c6-47c7-9510-5490a8ca6974	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.333	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0003)
3467c80c-1f4e-4432-897e-8ef19fc983de	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	d836dbbf-d7c5-4458-b4d6-99ad5db38f56	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.446	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0004)
c6c0597c-cb06-4081-bf72-1803a3e51be9	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	aaa2041f-2216-4e49-89b4-12e322534ea7	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.553	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0005)
13f96266-69b0-40f7-add0-05265fdae569	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	b4780b77-ebe2-4763-b2b1-3986e5b4c96c	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.665	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0006)
5f7281d4-8191-45a2-b788-406a61de019a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	ecce41c5-440c-436d-920d-8e08ecd5a1b2	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.77	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0007)
fc62c4b8-2cbf-41ca-9bad-807fe07bbd3d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	7c754025-74a0-4dc0-b9ea-ac339756f4cd	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.922	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0008)
3d97b341-0644-4567-945a-20987e6ec973	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	6133c8da-d221-4d6b-a568-770bdbf03129	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.075	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0009)
6e479b36-a5df-4cfb-b9e2-7d4cd4248db0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MOVEMENT	89964ee2-223d-45d2-83c5-3dadd20e7655	POST	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.252	null	null	\N	\N	OPENING_BALANCE posted (OB-2603-0010)
5d66a851-073d-4f60-8dec-b167a9929023	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	USER	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	LOGIN	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:21:05.063	\N	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	\N
\.


--
-- TOC entry 4150 (class 0 OID 82129)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.categories (id, "tenantId", name, description, "isActive", "createdAt", "updatedAt", "departmentId") FROM stdin;
17441a0d-51da-41fe-a608-bb15c44c86c1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Apartment utensils	Housekeeping	t	2026-03-11 22:48:31.646	2026-03-18 15:45:44.395	b12e457a-3082-4954-aef5-a5d05074ff87
75cfe947-32bd-4562-9818-fec6fa0babe3	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	F&B OSE	Food & Beverage 	t	2026-03-11 22:48:31.825	2026-03-18 15:45:50.537	285860a8-eea8-4c9c-b5b8-08be9ffe0d37
ab9f1ea1-b0b5-4618-97d0-51504945effa	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Flatware	Housekeeping	t	2026-03-11 22:48:31.732	2026-03-18 15:45:55.165	b12e457a-3082-4954-aef5-a5d05074ff87
e783a355-cfb9-4d20-93f5-6e8adcbda8c4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Glassware	Housekeeping 	t	2026-03-11 22:48:31.683	2026-03-18 15:45:59.375	b12e457a-3082-4954-aef5-a5d05074ff87
1eacc4ed-92c3-4795-a84d-e40c1d90b46b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Linen & Bedding		t	2026-03-11 22:48:31.597	2026-03-18 15:46:04.274	b12e457a-3082-4954-aef5-a5d05074ff87
bcb28ca4-500d-4ec1-9971-c2943bca12eb	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Engineering		t	2026-03-11 22:48:31.78	2026-03-18 15:46:29.379	6c60e01f-cb0c-4295-a71a-c9c294a255ba
\.


--
-- TOC entry 4183 (class 0 OID 83090)
-- Dependencies: 252
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.departments (id, "tenantId", name, code, "isActive", "createdAt", "updatedAt") FROM stdin;
b12e457a-3082-4954-aef5-a5d05074ff87	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Housekeeping	HK	t	2026-03-11 22:48:31.434	2026-03-11 22:48:31.434
285860a8-eea8-4c9c-b5b8-08be9ffe0d37	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Food & Beverage	FB	t	2026-03-11 22:48:31.449	2026-03-11 22:48:31.449
e77869e8-5be0-436d-bcb2-6ddca454c476	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Engineering	ENG	t	2026-03-11 22:48:31.458	2026-03-11 22:48:31.458
6c60e01f-cb0c-4295-a71a-c9c294a255ba	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	General	GEN	t	2026-03-11 22:48:31.478	2026-03-11 22:48:31.478
\.


--
-- TOC entry 4191 (class 0 OID 84795)
-- Dependencies: 260
-- Data for Name: doc_sequence; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.doc_sequence (id, "tenantId", prefix, year, "lastSeq") FROM stdin;
8e248ac2-58d2-480d-9521-e84d1f87bd00	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB	2026	10
b1010298-0ef0-4176-bea8-3f6dac20918d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	GP	2026	1
\.


--
-- TOC entry 4190 (class 0 OID 83161)
-- Dependencies: 259
-- Data for Name: generated_reports; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.generated_reports (id, "tenantId", "reportType", "reportName", "departmentId", "startDate", "endDate", data, "generatedBy", "createdAt") FROM stdin;
6f8d7168-bbfd-45e3-b0ab-c331560ac24a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 1, "date": "2026-03-19", "value": 4.28, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "department": "Housekeeping", "documentNo": "BRK-2603-0002"}], "deptNames": "Housekeeping"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:38:18.828
4333a4d8-d46c-44a2-8c1c-c442218b53b1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-02-28 00:00:00	2026-03-18 20:59:59.999	{"rows": [{"category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "closingQty": 20, "openingQty": 20, "physicalQty": 20, "varianceQty": 0, "closingValue": 8377.4, "openingValue": 8377.4, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "closingQty": 10, "openingQty": 10, "physicalQty": 10, "varianceQty": 0, "closingValue": 4188.7, "openingValue": 4188.7, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "closingQty": 10, "openingQty": 10, "physicalQty": 10, "varianceQty": 0, "closingValue": 2000, "openingValue": 2000, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "closingQty": 10, "openingQty": 10, "physicalQty": 10, "varianceQty": 0, "closingValue": 2000, "openingValue": 2000, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "closingQty": 50, "openingQty": 50, "physicalQty": 50, "varianceQty": 0, "closingValue": 10000, "openingValue": 10000, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "closingQty": 20, "openingQty": 20, "physicalQty": 20, "varianceQty": 0, "closingValue": 3326, "openingValue": 3326, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "closingQty": 50, "openingQty": 50, "physicalQty": 50, "varianceQty": 0, "closingValue": 8315, "openingValue": 8315, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "closingQty": 25, "openingQty": 25, "physicalQty": 25, "varianceQty": 0, "closingValue": 4157.5, "openingValue": 4157.5, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "closingQty": 10, "openingQty": 10, "physicalQty": 10, "varianceQty": 0, "closingValue": 2000, "openingValue": 2000, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "closingQty": 12, "openingQty": 12, "physicalQty": 12, "varianceQty": 0, "closingValue": 1995.6, "openingValue": 1995.6, "varianceValue": 0}, {"category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "closingQty": 876, "openingQty": 876, "physicalQty": 876, "varianceQty": 0, "closingValue": 3749.28, "openingValue": 3749.28, "varianceValue": 0}, {"category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "closingQty": 191, "openingQty": 191, "physicalQty": 191, "varianceQty": 0, "closingValue": 1268.24, "openingValue": 1268.24, "varianceValue": 0}, {"category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "closingQty": 82, "openingQty": 82, "physicalQty": 82, "varianceQty": 0, "closingValue": 9387.36, "openingValue": 9387.36, "varianceValue": 0}, {"category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "closingQty": 82, "openingQty": 82, "physicalQty": 82, "varianceQty": 0, "closingValue": 3006.12, "openingValue": 3006.12, "varianceValue": 0}, {"category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "closingQty": 67, "openingQty": 67, "physicalQty": 67, "varianceQty": 0, "closingValue": 5074.58, "openingValue": 5074.58, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "closingQty": 36, "openingQty": 36, "physicalQty": 36, "varianceQty": 0, "closingValue": 15079.32, "openingValue": 15079.32, "varianceValue": 0}, {"category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "closingQty": 40, "openingQty": 40, "physicalQty": 40, "varianceQty": 0, "closingValue": 16754.8, "openingValue": 16754.8, "varianceValue": 0}, {"category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "closingQty": 100, "openingQty": 100, "physicalQty": 100, "varianceQty": 0, "closingValue": 2030, "openingValue": 2030, "varianceValue": 0}, {"category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "closingQty": 800, "openingQty": 800, "physicalQty": 800, "varianceQty": 0, "closingValue": 4704, "openingValue": 4704, "varianceValue": 0}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 23:10:18.92
a2caf7c4-28a6-4c05-bdef-21edde4ba222	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report	\N	2026-02-28 00:00:00	2026-03-18 20:59:59.999	{"rows": [], "deptNames": "All Departments", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 23:11:22.291
07aee2d8-459a-4a30-a627-cd9b05a9a56d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	TRANSFERS	TRANSFERS Report	\N	2026-02-28 00:00:00	2026-03-18 20:59:59.999	{"rows": [], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 23:11:25.891
f27a334c-6b9f-4fdb-8162-12b4e8571b78	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	AGING	AGING Report	\N	2026-02-28 00:00:00	2026-03-18 20:59:59.999	{"rows": [{"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "qtyOnHand": 20, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "qtyOnHand": 50, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "qtyOnHand": 20, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "qtyOnHand": 50, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "qtyOnHand": 25, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "qtyOnHand": 12, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Flatware", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "qtyOnHand": 876, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Flatware", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "qtyOnHand": 191, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Apartment utensils", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "qtyOnHand": 82, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Apartment utensils", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "qtyOnHand": 82, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Apartment utensils", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "qtyOnHand": 67, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "qtyOnHand": 36, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "qtyOnHand": 40, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Glassware", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "qtyOnHand": 100, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Glassware", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "qtyOnHand": 800, "lastReceiveDate": "2026-03-18"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 23:11:29.611
bf813f5a-5c49-44b0-90ba-f2308817afa1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:11:18.366
5824fe7b-4a9e-4932-a3e0-f1cc8ec778a2	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"inQty": 0, "obQty": 50, "adjQty": -5, "outQty": 5, "inValue": 0, "obValue": 20943.5, "adjValue": -2094.35, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "outValue": 2094.35, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 12, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 1995.6, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 12, "department": "Food & Beverage", "openingQty": 0, "closingValue": 1995.6, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4188.7, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4188.7, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 10000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 10000, "openingValue": 0}, {"inQty": 0, "obQty": 25, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4157.5, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 25, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4157.5, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8377.4, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8377.4, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8315, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8315, "openingValue": 0}, {"inQty": 10, "obQty": 30, "adjQty": 0, "outQty": 0, "inValue": 4188.7, "obValue": 12566.1, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 3326, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 3326, "openingValue": 0}, {"inQty": 0, "obQty": 112, "adjQty": -12, "outQty": 0, "inValue": 0, "obValue": 2273.6, "adjValue": -243.6, "category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 20.3, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 2030, "openingValue": 0}, {"inQty": 0, "obQty": 892, "adjQty": -92, "outQty": 0, "inValue": 0, "obValue": 5244.96, "adjValue": -540.96, "category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 5.88, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 4704, "openingValue": 0}, {"inQty": 0, "obQty": 876, "adjQty": -75, "outQty": 1, "inValue": 0, "obValue": 3749.28, "adjValue": -321, "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "outValue": 4.28, "tfrInQty": 0, "unitCost": 4.28, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 3424, "openingValue": 0}, {"inQty": 0, "obQty": 191, "adjQty": -91, "outQty": 0, "inValue": 0, "obValue": 1268.24, "adjValue": -604.24, "category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "outValue": 0, "tfrInQty": 0, "unitCost": 6.64, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 664, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 3006.12, "adjValue": -73.32, "category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 36.66, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 2932.8, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 9387.36, "adjValue": -228.96, "category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 114.48, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 9158.4, "openingValue": 0}, {"inQty": 0, "obQty": 67, "adjQty": -7, "outQty": 0, "inValue": 0, "obValue": 5074.58, "adjValue": -530.18, "category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 75.74, "tfrOutQty": 0, "closingQty": 60, "department": "Housekeeping", "openingQty": 0, "closingValue": 4544.4, "openingValue": 0}], "deptNames": "All Departments", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:32:57.136
ad9f70b6-4ac9-4e3b-b555-43ace0fd197d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:17:49.589
8e9b175c-a8f6-4db9-874a-b142d44584ca	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:20:33.412
feb0c176-92e4-4fcb-a858-0c58a9bf39bf	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Food & Beverage	285860a8-eea8-4c9c-b5b8-08be9ffe0d37	2025-12-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}], "deptNames": "Food & Beverage", "locations": [{"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:22:37.557
5f77de11-37f7-448b-b435-7fc8dca4de13	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:24:19.744
4eb730ba-073d-4ed1-988d-33314d018f3b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:28:20.214
8079d080-7566-4f65-bb5b-bc2fec434883	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:31:33.48
38fc6a9f-d65d-4bbe-881e-00ec3c8ae38f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 18:36:31.016
e5042430-8206-4655-a6ae-2f5080b4c5bc	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-02-28 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 22:54:28.449
1063fa9f-185c-49dc-9a18-747ed1336285	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-02-28 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "Housekeeping", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 22:54:38.452
c8f6e8b4-54a6-4711-a44b-e103837b700e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-02-28 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 22:58:47.201
60f96685-4edd-4f27-9a8e-19ce33c78d1d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-02-28 00:00:00	2026-03-19 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 23:09:50.763
c7899840-2a78-4e91-a74f-76877d567ce1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:04:47.534
ab903a64-cbbc-4aa2-943b-2cd9c0b43be7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:05:40.627
df54beb1-c66c-41fa-9c3b-b63e3e76e4a8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 2030, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 2030}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 800, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 0, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 4704, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 4704}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:07:11.435
4f7144ca-9408-45b7-872f-f66faa356cda	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Food & Beverage	285860a8-eea8-4c9c-b5b8-08be9ffe0d37	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": 101, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 4, "closingValue": 0, "locationQtys": {"9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": 42305.87, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 1675.48, "theoreticalQty": 102, "theoreticalValue": 42724.74}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 0, "locationQtys": {"9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 16000, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 16000}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 107, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 0, "closingValue": 0, "locationQtys": {"9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 17794.1, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 107, "theoreticalValue": 17794.1}], "deptNames": "Food & Beverage", "locations": [{"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:09:51.647
50b83ccb-1ca6-4215-ad74-d45b6e8a3c4f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 2932.8, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 9158.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 4544.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}], "deptNames": "Housekeeping", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:13:58.47
b33dc642-4772-46df-93e7-65054f92b16f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 2932.8, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 9158.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 4544.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}], "deptNames": "Housekeeping", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:14:26.63
27f98ded-2aff-4fd8-aa12-ce460c78633e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	AGING	AGING Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"bucket": "0-30 Days", "daysOld": 1, "category": "Apartment utensils", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "qtyOnHand": 80, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Apartment utensils", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "qtyOnHand": 60, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "qtyOnHand": 20, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "qtyOnHand": 50, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "qtyOnHand": 20, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "qtyOnHand": 50, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "qtyOnHand": 25, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Flatware", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "qtyOnHand": 100, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "qtyOnHand": 12, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "qtyOnHand": 36, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "qtyOnHand": 40, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Glassware", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "qtyOnHand": 100, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Glassware", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "qtyOnHand": 800, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Apartment utensils", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "qtyOnHand": 80, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Flatware", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "qtyOnHand": 800, "lastReceiveDate": "2026-03-19"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:40:24.766
34200429-0d3e-4366-9227-9ce0649411d6	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 2932.8, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 9158.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 4544.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}], "deptNames": "Housekeeping", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:17:56.966
9fe688eb-d0ce-460a-a02d-5650d12d7085	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 2932.8, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 2932.8, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 2932.8}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 80, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 0, "closingValue": 9158.4, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 9158.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 80, "theoreticalValue": 9158.4}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 60, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 0, "closingValue": 4544.4, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 4544.4, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 60, "theoreticalValue": 4544.4}], "deptNames": "Housekeeping", "locations": [{"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:20:13.225
f73b9268-a13c-4825-8edf-8e295c35bd8a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 801, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 0, "closingValue": 3424, "locationQtys": {"4a439e1f-6691-4c06-9d26-3900297edaff": 800}, "openingValue": 3428.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 800, "theoreticalValue": 3424}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 100, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 0, "closingValue": 664, "locationQtys": {"4a439e1f-6691-4c06-9d26-3900297edaff": 100}, "openingValue": 664, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 0, "theoreticalQty": 100, "theoreticalValue": 664}], "deptNames": "Housekeeping", "locations": [{"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:20:34.101
9a51a588-ccf4-4eb7-bcce-ec517cf9d206	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:21:41.232
d17ba4f8-f29f-48a6-b55a-e8b1c0d2281c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 80, "closingValue": 2932.8, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 2932.8, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 80, "closingValue": 9158.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 9158.4, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 60, "closingValue": 4544.4, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 4544.4, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "1f012fcd-714d-4044-84ac-1947c36f4148", "category": "F&B OSE", "imageUrl": null, "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 10, "unitPrice": 418.87, "closingQty": 106, "openingQty": -4, "outwardQty": 0, "breakageQty": 5, "gatePassQty": 4, "inwardValue": 4188.7, "physicalQty": 106, "varianceQty": 109, "closingValue": 44400.22, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 10, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 20, "db831357-4777-4182-b53c-cc765c88462c": 40, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 36}, "openingValue": -1675.48, "outwardValue": 0, "breakageValue": 2094.35, "gatePassValue": 1675.48, "varianceValue": 45656.83, "theoreticalQty": -3, "theoreticalValue": -1256.61}, {"itemId": "88b57a91-fe18-4ca5-8061-cabb258e260b", "category": "F&B OSE", "imageUrl": null, "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 200, "closingQty": 80, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 80, "closingValue": 16000, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 50, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 10, "db831357-4777-4182-b53c-cc765c88462c": 10, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 10}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 16000, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "b1c25d7e-507a-43a1-b457-df05464756bf", "category": "F&B OSE", "imageUrl": null, "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 166.3, "closingQty": 107, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 107, "varianceQty": 107, "closingValue": 17794.1, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 25, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 50, "db831357-4777-4182-b53c-cc765c88462c": 12, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 20}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 17794.1, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 0, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 801, "closingValue": 3424, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 800, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": 3428.28, "theoreticalQty": -1, "theoreticalValue": -4.28}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 100, "closingValue": 664, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 0, "4a439e1f-6691-4c06-9d26-3900297edaff": 100, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 664, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "996bab5e-6c3c-46d8-82e1-2d27bac08c39", "category": "Glassware", "imageUrl": null, "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 20.3, "closingQty": 100, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": 100, "closingValue": 2030, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 100, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 2030, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "be3cd42e-626d-4a7a-95a5-b3aaff464259", "category": "Glassware", "imageUrl": null, "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 5.88, "closingQty": 800, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": 800, "closingValue": 4704, "locationQtys": {"4471aa5d-2df6-4283-8978-0312d5671e62": 800, "4a439e1f-6691-4c06-9d26-3900297edaff": 0, "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8": 0, "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f": 0, "db831357-4777-4182-b53c-cc765c88462c": 0, "dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 0, "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad": 0}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 4704, "theoreticalQty": 0, "theoreticalValue": 0}], "deptNames": "All Departments", "locations": [{"id": "4471aa5d-2df6-4283-8978-0312d5671e62", "name": "HK.Store Floor 1"}, {"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}, {"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}, {"id": "db831357-4777-4182-b53c-cc765c88462c", "name": "F&B Store"}, {"id": "a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f", "name": "F&B.Horizon"}, {"id": "e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad", "name": "F&B.Naya"}, {"id": "9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8", "name": "F&B.Anardana"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:25:14.087
15f8b625-b206-4b8a-b5d9-281c90c941de	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 80, "closingValue": 2932.8, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 2932.8, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": 80, "closingValue": 9158.4, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 9158.4, "theoreticalQty": 0, "theoreticalValue": 0}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 0, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": 60, "closingValue": 4544.4, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 0, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": 4544.4, "theoreticalQty": 0, "theoreticalValue": 0}], "deptNames": "Housekeeping", "locations": [{"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:25:34.876
2ba741cc-28d0-4867-a09b-7781e0369b79	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "7d6aa943-58bb-4372-b67e-cd0749e40de7", "category": "Apartment utensils", "imageUrl": null, "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 36.66, "closingQty": 80, "openingQty": 82, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": -2, "closingValue": 2932.8, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 3006.12, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": -73.32, "theoreticalQty": 82, "theoreticalValue": 3006.12}, {"itemId": "ac3a5b2e-6653-41fc-b2fa-6d180dd576dd", "category": "Apartment utensils", "imageUrl": null, "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 114.48, "closingQty": 80, "openingQty": 82, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 80, "varianceQty": -2, "closingValue": 9158.4, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 80}, "openingValue": 9387.36, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": -228.96, "theoreticalQty": 82, "theoreticalValue": 9387.36}, {"itemId": "61599286-8e27-4a13-8be5-f3d2d4eb7318", "category": "Apartment utensils", "imageUrl": null, "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 75.74, "closingQty": 60, "openingQty": 67, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 60, "varianceQty": -7, "closingValue": 4544.4, "locationQtys": {"dbac990f-bd35-4ae7-81cc-c18b39c6cec1": 60}, "openingValue": 5074.58, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": -530.18, "theoreticalQty": 67, "theoreticalValue": 5074.58}], "deptNames": "Housekeeping", "locations": [{"id": "dbac990f-bd35-4ae7-81cc-c18b39c6cec1", "name": "HK.Store Floor 3"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:28:46.994
2037f87d-e6cf-40ee-a77f-d8fa8b360cda	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 2094.35, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "department": "Food & Beverage", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 4.28, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "department": "Housekeeping", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:37:56.802
0daffec5-2099-482f-ba1c-bdba48527996	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	DETAIL	DETAIL Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"itemId": "a0f461b7-bca4-4e84-8968-1009eaf108b2", "category": "Flatware", "imageUrl": null, "itemCode": "975558202071", "itemName": "Demitasse Spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 4.28, "closingQty": 800, "openingQty": 876, "outwardQty": 0, "breakageQty": 1, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 800, "varianceQty": -75, "closingValue": 3424, "locationQtys": {"4a439e1f-6691-4c06-9d26-3900297edaff": 800}, "openingValue": 3749.28, "outwardValue": 0, "breakageValue": 4.28, "gatePassValue": 0, "varianceValue": -321, "theoreticalQty": 875, "theoreticalValue": 3745}, {"itemId": "8bfcf489-60a1-4cf7-be17-63aa1295334f", "category": "Flatware", "imageUrl": null, "itemCode": "385344859861", "itemName": "Iced tea spoon", "supplier": "Hotel Amenities MENA", "inwardQty": 0, "unitPrice": 6.64, "closingQty": 100, "openingQty": 191, "outwardQty": 0, "breakageQty": 0, "gatePassQty": 0, "inwardValue": 0, "physicalQty": 100, "varianceQty": -91, "closingValue": 664, "locationQtys": {"4a439e1f-6691-4c06-9d26-3900297edaff": 100}, "openingValue": 1268.24, "outwardValue": 0, "breakageValue": 0, "gatePassValue": 0, "varianceValue": -604.24, "theoreticalQty": 191, "theoreticalValue": 1268.24}], "deptNames": "Housekeeping", "locations": [{"id": "4a439e1f-6691-4c06-9d26-3900297edaff", "name": "HK.Store Floor 2"}]}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:28:53.121
cbf7950e-44fa-47c2-af1d-de86e3b3b5c5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:29:56.808
7e9deb14-e8e8-4632-91b1-56cf1e97acd9	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:34:17.131
f6351d88-7e20-49d1-9355-4fe87cbb4c1a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:34:24.341
f1707c9d-9e41-4252-9ecd-531c22286df7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:34:30.928
b815b9ca-2140-46aa-9b53-c2270bc5d5c7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 0, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 0, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:35:07.032
5f4a2672-4567-4433-bcee-2b158ca861d7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 2094.35, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 4.28, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:35:33.779
18958dbc-fbb8-45e3-ac56-869990619bc1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 2094.35, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 4.28, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:37:31.319
b891e16c-2159-4915-be5d-484307133c76	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"inQty": 0, "obQty": 50, "adjQty": -5, "outQty": 5, "inValue": 0, "obValue": 20943.5, "adjValue": -2094.35, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "outValue": 2094.35, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 12, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 1995.6, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 12, "department": "Food & Beverage", "openingQty": 0, "closingValue": 1995.6, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4188.7, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4188.7, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 10000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 10000, "openingValue": 0}, {"inQty": 0, "obQty": 25, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4157.5, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 25, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4157.5, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8377.4, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8377.4, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8315, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8315, "openingValue": 0}, {"inQty": 10, "obQty": 30, "adjQty": 0, "outQty": 0, "inValue": 4188.7, "obValue": 12566.1, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 3326, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 3326, "openingValue": 0}, {"inQty": 0, "obQty": 112, "adjQty": -12, "outQty": 0, "inValue": 0, "obValue": 2273.6, "adjValue": -243.6, "category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 20.3, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 2030, "openingValue": 0}, {"inQty": 0, "obQty": 892, "adjQty": -92, "outQty": 0, "inValue": 0, "obValue": 5244.96, "adjValue": -540.96, "category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 5.88, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 4704, "openingValue": 0}, {"inQty": 0, "obQty": 876, "adjQty": -75, "outQty": 1, "inValue": 0, "obValue": 3749.28, "adjValue": -321, "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "outValue": 4.28, "tfrInQty": 0, "unitCost": 4.28, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 3424, "openingValue": 0}, {"inQty": 0, "obQty": 191, "adjQty": -91, "outQty": 0, "inValue": 0, "obValue": 1268.24, "adjValue": -604.24, "category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "outValue": 0, "tfrInQty": 0, "unitCost": 6.64, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 664, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 3006.12, "adjValue": -73.32, "category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 36.66, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 2932.8, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 9387.36, "adjValue": -228.96, "category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 114.48, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 9158.4, "openingValue": 0}, {"inQty": 0, "obQty": 67, "adjQty": -7, "outQty": 0, "inValue": 0, "obValue": 5074.58, "adjValue": -530.18, "category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 75.74, "tfrOutQty": 0, "closingQty": 60, "department": "Housekeeping", "openingQty": 0, "closingValue": 4544.4, "openingValue": 0}], "deptNames": "All Departments", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:40:01.157
fda35fde-1a26-4c4c-b0a3-ff7a662197bc	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	TRANSFERS	TRANSFERS Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 00:40:22.216
30cc8bf4-b372-4382-ad3b-6ea808b25d04	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"inQty": 0, "obQty": 50, "adjQty": -5, "outQty": 5, "inValue": 0, "obValue": 20943.5, "adjValue": -2094.35, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "outValue": 2094.35, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 12, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 1995.6, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 12, "department": "Food & Beverage", "openingQty": 0, "closingValue": 1995.6, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4188.7, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4188.7, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 10000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 10000, "openingValue": 0}, {"inQty": 0, "obQty": 25, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4157.5, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 25, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4157.5, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8377.4, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8377.4, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8315, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8315, "openingValue": 0}, {"inQty": 10, "obQty": 30, "adjQty": 0, "outQty": 0, "inValue": 4188.7, "obValue": 12566.1, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 3326, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 3326, "openingValue": 0}, {"inQty": 0, "obQty": 112, "adjQty": -12, "outQty": 0, "inValue": 0, "obValue": 2273.6, "adjValue": -243.6, "category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 20.3, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 2030, "openingValue": 0}, {"inQty": 0, "obQty": 892, "adjQty": -92, "outQty": 0, "inValue": 0, "obValue": 5244.96, "adjValue": -540.96, "category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 5.88, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 4704, "openingValue": 0}, {"inQty": 0, "obQty": 876, "adjQty": -75, "outQty": 1, "inValue": 0, "obValue": 3749.28, "adjValue": -321, "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "outValue": 4.28, "tfrInQty": 0, "unitCost": 4.28, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 3424, "openingValue": 0}, {"inQty": 0, "obQty": 191, "adjQty": -91, "outQty": 0, "inValue": 0, "obValue": 1268.24, "adjValue": -604.24, "category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "outValue": 0, "tfrInQty": 0, "unitCost": 6.64, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 664, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 3006.12, "adjValue": -73.32, "category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 36.66, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 2932.8, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 9387.36, "adjValue": -228.96, "category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 114.48, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 9158.4, "openingValue": 0}, {"inQty": 0, "obQty": 67, "adjQty": -7, "outQty": 0, "inValue": 0, "obValue": 5074.58, "adjValue": -530.18, "category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 75.74, "tfrOutQty": 0, "closingQty": 60, "department": "Housekeeping", "openingQty": 0, "closingValue": 4544.4, "openingValue": 0}], "deptNames": "All Departments", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:37:54.247
e9397b2c-cbb2-4ab7-8ef2-3e24a9189b98	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"inQty": 0, "obQty": 50, "adjQty": -5, "outQty": 5, "inValue": 0, "obValue": 20943.5, "adjValue": -2094.35, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "outValue": 2094.35, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 12, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 1995.6, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 12, "department": "Food & Beverage", "openingQty": 0, "closingValue": 1995.6, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4188.7, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4188.7, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 10000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 10000, "openingValue": 0}, {"inQty": 0, "obQty": 25, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4157.5, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 25, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4157.5, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8377.4, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8377.4, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8315, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8315, "openingValue": 0}, {"inQty": 10, "obQty": 30, "adjQty": 0, "outQty": 0, "inValue": 4188.7, "obValue": 12566.1, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 3326, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 3326, "openingValue": 0}, {"inQty": 0, "obQty": 112, "adjQty": -12, "outQty": 0, "inValue": 0, "obValue": 2273.6, "adjValue": -243.6, "category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 20.3, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 2030, "openingValue": 0}, {"inQty": 0, "obQty": 892, "adjQty": -92, "outQty": 0, "inValue": 0, "obValue": 5244.96, "adjValue": -540.96, "category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 5.88, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 4704, "openingValue": 0}, {"inQty": 0, "obQty": 876, "adjQty": -75, "outQty": 1, "inValue": 0, "obValue": 3749.28, "adjValue": -321, "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "outValue": 4.28, "tfrInQty": 0, "unitCost": 4.28, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 3424, "openingValue": 0}, {"inQty": 0, "obQty": 191, "adjQty": -91, "outQty": 0, "inValue": 0, "obValue": 1268.24, "adjValue": -604.24, "category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "outValue": 0, "tfrInQty": 0, "unitCost": 6.64, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 664, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 3006.12, "adjValue": -73.32, "category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 36.66, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 2932.8, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 9387.36, "adjValue": -228.96, "category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 114.48, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 9158.4, "openingValue": 0}, {"inQty": 0, "obQty": 67, "adjQty": -7, "outQty": 0, "inValue": 0, "obValue": 5074.58, "adjValue": -530.18, "category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 75.74, "tfrOutQty": 0, "closingQty": 60, "department": "Housekeeping", "openingQty": 0, "closingValue": 4544.4, "openingValue": 0}], "deptNames": "All Departments", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:39:30.552
d2efa22e-82a2-4433-bc91-5d547bf49004	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	AGING	AGING Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"bucket": "0-30 Days", "daysOld": 1, "category": "Apartment utensils", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "qtyOnHand": 80, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Apartment utensils", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "qtyOnHand": 60, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "qtyOnHand": 20, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "qtyOnHand": 50, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "qtyOnHand": 20, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "qtyOnHand": 50, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "qtyOnHand": 25, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Flatware", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "qtyOnHand": 100, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "qtyOnHand": 10, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "qtyOnHand": 12, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "qtyOnHand": 36, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "F&B OSE", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "qtyOnHand": 40, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Glassware", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "qtyOnHand": 100, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Glassware", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "qtyOnHand": 800, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 1, "category": "Apartment utensils", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "qtyOnHand": 80, "lastReceiveDate": "2026-03-18"}, {"bucket": "0-30 Days", "daysOld": 0, "category": "Flatware", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "qtyOnHand": 800, "lastReceiveDate": "2026-03-19"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:39:53.924
9db41334-37d8-43bc-bbea-f883f56ddc98	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report — Housekeeping	b12e457a-3082-4954-aef5-a5d05074ff87	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"inQty": 0, "obQty": 112, "adjQty": -12, "outQty": 0, "inValue": 0, "obValue": 2273.6, "adjValue": -243.6, "category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 20.3, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 2030, "openingValue": 0}, {"inQty": 0, "obQty": 892, "adjQty": -92, "outQty": 0, "inValue": 0, "obValue": 5244.96, "adjValue": -540.96, "category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 5.88, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 4704, "openingValue": 0}, {"inQty": 0, "obQty": 876, "adjQty": -75, "outQty": 1, "inValue": 0, "obValue": 3749.28, "adjValue": -321, "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "outValue": 4.28, "tfrInQty": 0, "unitCost": 4.28, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 3424, "openingValue": 0}, {"inQty": 0, "obQty": 191, "adjQty": -91, "outQty": 0, "inValue": 0, "obValue": 1268.24, "adjValue": -604.24, "category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "outValue": 0, "tfrInQty": 0, "unitCost": 6.64, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 664, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 3006.12, "adjValue": -73.32, "category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 36.66, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 2932.8, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 9387.36, "adjValue": -228.96, "category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 114.48, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 9158.4, "openingValue": 0}, {"inQty": 0, "obQty": 67, "adjQty": -7, "outQty": 0, "inValue": 0, "obValue": 5074.58, "adjValue": -530.18, "category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 75.74, "tfrOutQty": 0, "closingQty": 60, "department": "Housekeeping", "openingQty": 0, "closingValue": 4544.4, "openingValue": 0}], "deptNames": "Housekeeping", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:41:09.074
be929d0b-adc3-4d38-aa81-3f6a436cb490	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BREAKAGE	BREAKAGE Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"qty": 5, "date": "2026-03-18", "value": 2094.35, "reason": "Breakage", "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "createdBy": "Amr Admin", "department": "Food & Beverage", "documentNo": "BRK-2603-0001"}, {"qty": 1, "date": "2026-03-19", "value": 4.28, "reason": "Breakage", "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "createdBy": "Amr Admin", "department": "Housekeeping", "documentNo": "BRK-2603-0002"}], "deptNames": "All Departments"}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:44:27.47
aced67d2-a017-4aea-b2cc-739faac19027	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OMC	OMC Report	\N	2026-03-01 00:00:00	2026-03-20 20:59:59.999	{"rows": [{"inQty": 0, "obQty": 50, "adjQty": -5, "outQty": 5, "inValue": 0, "obValue": 20943.5, "adjValue": -2094.35, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B Store", "outValue": 2094.35, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 12, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 1995.6, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B Store", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 12, "department": "Food & Beverage", "openingQty": 0, "closingValue": 1995.6, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4188.7, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4188.7, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 10000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 10000, "openingValue": 0}, {"inQty": 0, "obQty": 25, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 4157.5, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Anardana", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 25, "department": "Food & Beverage", "openingQty": 0, "closingValue": 4157.5, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8377.4, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8377.4, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 50, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 8315, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Horizon", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 50, "department": "Food & Beverage", "openingQty": 0, "closingValue": 8315, "openingValue": 0}, {"inQty": 10, "obQty": 30, "adjQty": 0, "outQty": 0, "inValue": 4188.7, "obValue": 12566.1, "adjValue": 0, "category": "F&B OSE", "itemCode": "468749972186", "itemName": "Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 418.87, "tfrOutQty": 0, "closingQty": 40, "department": "Food & Beverage", "openingQty": 0, "closingValue": 16754.8, "openingValue": 0}, {"inQty": 0, "obQty": 10, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 2000, "adjValue": 0, "category": "F&B OSE", "itemCode": "889293811130", "itemName": "Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 200, "tfrOutQty": 0, "closingQty": 10, "department": "Food & Beverage", "openingQty": 0, "closingValue": 2000, "openingValue": 0}, {"inQty": 0, "obQty": 20, "adjQty": 0, "outQty": 0, "inValue": 0, "obValue": 3326, "adjValue": 0, "category": "F&B OSE", "itemCode": "645862480080", "itemName": "Platter Duo - White China - 23.5x14x5cm - 6pcs", "location": "F&B.Naya", "outValue": 0, "tfrInQty": 0, "unitCost": 166.3, "tfrOutQty": 0, "closingQty": 20, "department": "Food & Beverage", "openingQty": 0, "closingValue": 3326, "openingValue": 0}, {"inQty": 0, "obQty": 112, "adjQty": -12, "outQty": 0, "inValue": 0, "obValue": 2273.6, "adjValue": -243.6, "category": "Glassware", "itemCode": "508041819053", "itemName": "MR. CHEF * Insalatiera L\\r\\nSalad Bowl L\\r\\n162 cl - 54 3/4 oz\\r\\nh 97 mm - 3 3/4”\\r\\nMax Ø 222 mm - 8 3/4”", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 20.3, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 2030, "openingValue": 0}, {"inQty": 0, "obQty": 892, "adjQty": -92, "outQty": 0, "inValue": 0, "obValue": 5244.96, "adjValue": -540.96, "category": "Glassware", "itemCode": "449521949251", "itemName": "SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100", "location": "HK.Store Floor 1", "outValue": 0, "tfrInQty": 0, "unitCost": 5.88, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 4704, "openingValue": 0}, {"inQty": 0, "obQty": 876, "adjQty": -75, "outQty": 1, "inValue": 0, "obValue": 3749.28, "adjValue": -321, "category": "Flatware", "itemCode": "975558202071", "itemName": "Demitasse Spoon", "location": "HK.Store Floor 2", "outValue": 4.28, "tfrInQty": 0, "unitCost": 4.28, "tfrOutQty": 0, "closingQty": 800, "department": "Housekeeping", "openingQty": 0, "closingValue": 3424, "openingValue": 0}, {"inQty": 0, "obQty": 191, "adjQty": -91, "outQty": 0, "inValue": 0, "obValue": 1268.24, "adjValue": -604.24, "category": "Flatware", "itemCode": "385344859861", "itemName": "Iced tea spoon", "location": "HK.Store Floor 2", "outValue": 0, "tfrInQty": 0, "unitCost": 6.64, "tfrOutQty": 0, "closingQty": 100, "department": "Housekeeping", "openingQty": 0, "closingValue": 664, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 3006.12, "adjValue": -73.32, "category": "Apartment utensils", "itemCode": "727613007804", "itemName": "Lid Dia 20 cm", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 36.66, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 2932.8, "openingValue": 0}, {"inQty": 0, "obQty": 82, "adjQty": -2, "outQty": 0, "inValue": 0, "obValue": 9387.36, "adjValue": -228.96, "category": "Apartment utensils", "itemCode": "873236597448", "itemName": "LOW CASSEROLE CM20 TENDER", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 114.48, "tfrOutQty": 0, "closingQty": 80, "department": "Housekeeping", "openingQty": 0, "closingValue": 9158.4, "openingValue": 0}, {"inQty": 0, "obQty": 67, "adjQty": -7, "outQty": 0, "inValue": 0, "obValue": 5074.58, "adjValue": -530.18, "category": "Apartment utensils", "itemCode": "101577826647", "itemName": "Non-Stick Fryingpan Cm.24 Aluminium", "location": "HK.Store Floor 3", "outValue": 0, "tfrInQty": 0, "unitCost": 75.74, "tfrOutQty": 0, "closingQty": 60, "department": "Housekeeping", "openingQty": 0, "closingValue": 4544.4, "openingValue": 0}], "deptNames": "All Departments", "snapshotUsed": null}	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:48:08.738
\.


--
-- TOC entry 4194 (class 0 OID 89106)
-- Dependencies: 263
-- Data for Name: get_pass_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.get_pass_lines (id, "getPassId", "itemId", "locationId", qty, "qtyReturned", "unitCost", "conditionOut", status, notes) FROM stdin;
e1c10281-00b2-4869-a94a-6f36d1316545	8c1592f4-13e4-4edb-ba95-c936c0760e85	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	2.0000	2.0000	418.8700	\N	RETURNED	\N
8dd4fa2c-b720-4fa1-9bd6-da0ac71cad71	8c1592f4-13e4-4edb-ba95-c936c0760e85	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	2.0000	2.0000	418.8700	\N	RETURNED	\N
\.


--
-- TOC entry 4195 (class 0 OID 89116)
-- Dependencies: 264
-- Data for Name: get_pass_returns; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.get_pass_returns (id, "getPassLineId", "qtyReturned", "conditionIn", "returnDate", "registeredBy", "securityVerifiedBy", notes) FROM stdin;
c56438e0-9e49-4edc-b796-067c878c2caa	e1c10281-00b2-4869-a94a-6f36d1316545	2.0000		2026-03-20 01:45:16.679	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	\N	\N
59c590aa-12ef-4768-ae97-0b642438824d	8dd4fa2c-b720-4fa1-9bd6-da0ac71cad71	2.0000		2026-03-20 01:45:16.711	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	\N	\N
\.


--
-- TOC entry 4193 (class 0 OID 89097)
-- Dependencies: 262
-- Data for Name: get_passes; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.get_passes (id, "tenantId", "passNo", "transferType", "departmentId", "borrowingEntity", "expectedReturnDate", status, "deptApprovedBy", "deptApprovedAt", "financeApprovedBy", "financeApprovedAt", "securityApprovedBy", "securityApprovedAt", "checkedOutBy", "checkedOutAt", "closedBy", "closedAt", reason, notes, "createdBy", "createdAt", "updatedAt") FROM stdin;
8c1592f4-13e4-4edb-ba95-c936c0760e85	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	GP-2026-00001	CATERING	285860a8-eea8-4c9c-b5b8-08be9ffe0d37	Aramco Event 	2026-03-19 21:00:00	RETURNED	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:08.043	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:09.007	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:10.109	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:12.602	\N	\N	BEO OSC Event 18.03.20269	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:04.112	2026-03-20 01:45:16.724
\.


--
-- TOC entry 4169 (class 0 OID 82575)
-- Dependencies: 238
-- Data for Name: grn_imports; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.grn_imports (id, "tenantId", "grnNumber", "vendorId", "vendorNameSnapshot", "locationId", "receivingDate", "pdfAttachmentUrl", status, "rejectionReason", notes, "importedBy", "approvedBy", "rejectedBy", "postedAt", "createdAt", "updatedAt") FROM stdin;
b5a3fc06-2a88-40be-bc30-7c77484eb41c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	55488848484	33fc30c3-1044-4b7b-8e11-c24cfdf64371	Gulf Cleaning Supplies	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	2026-03-18 00:00:00	C:\\Users\\amrsa\\.gemini\\antigravity\\scratch\\ose-inventory-system\\backend\\uploads\\grn\\invoices\\b5e63d374a00926f1f1903373ccaebff	POSTED	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	\N	2026-03-18 22:34:29.551	2026-03-18 22:32:21.228	2026-03-18 22:34:29.551
\.


--
-- TOC entry 4170 (class 0 OID 82586)
-- Dependencies: 239
-- Data for Name: grn_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.grn_lines (id, "grnImportId", "futurelogItemCode", "futurelogDescription", "futurelogUom", "orderedQty", "receivedQty", "unitPrice", "internalItemId", "internalUomId", "conversionFactor", "qtyInBaseUnit", "isMapped") FROM stdin;
d0548763-dcbc-43ff-a8cc-05c4e2501fe4	b5a3fc06-2a88-40be-bc30-7c77484eb41c	468749972186	Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs	9a3364e3-f461-4968-8e81-f42973afea23	10.0000	10.0000	418.8700	1f012fcd-714d-4044-84ac-1947c36f4148	9a3364e3-f461-4968-8e81-f42973afea23	1.000000	10.0000	t
\.


--
-- TOC entry 4165 (class 0 OID 82266)
-- Dependencies: 234
-- Data for Name: import_rows; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.import_rows (id, "sessionId", "rowNumber", "rawData", "mappedData", status, errors, warnings) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 82253)
-- Dependencies: 233
-- Data for Name: import_sessions; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.import_sessions (id, "tenantId", filename, status, "totalRows", "validRows", "errorRows", "warningRows", "columnMap", "importedBy", "importedAt", "createdAt") FROM stdin;
\.


--
-- TOC entry 4158 (class 0 OID 82197)
-- Dependencies: 227
-- Data for Name: inventory_ledger; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.inventory_ledger (id, "tenantId", "itemId", "locationId", "movementType", "qtyIn", "qtyOut", "unitCost", "totalValue", "referenceType", "referenceId", "referenceNo", "requiresApproval", "approvalId", notes, "createdBy", "createdAt") FROM stdin;
5c3df819-c242-4c01-aa24-8db5e3c76add	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	be3cd42e-626d-4a7a-95a5-b3aaff464259	4471aa5d-2df6-4283-8978-0312d5671e62	OPENING_BALANCE	892.0000	0.0000	5.8800	5244.9600	MOVEMENT	7a0d65cd-266f-4072-8936-89861d2304a4	OB-2603-0001	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:24.944
b34bdfa0-4489-4f46-8555-342ddf1b1fe0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	996bab5e-6c3c-46d8-82e1-2d27bac08c39	4471aa5d-2df6-4283-8978-0312d5671e62	OPENING_BALANCE	112.0000	0.0000	20.3000	2273.6000	MOVEMENT	8ebb499d-b08b-4933-9c20-039c1914eda2	OB-2603-0002	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.181
101f5da8-2632-4846-b57b-f75b4c6478ff	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	OPENING_BALANCE	876.0000	0.0000	4.2800	3749.2800	MOVEMENT	9952587d-d5c6-47c7-9510-5490a8ca6974	OB-2603-0003	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.309
9d141a6f-361e-46a7-bfb7-d87bab117b5d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	8bfcf489-60a1-4cf7-be17-63aa1295334f	4a439e1f-6691-4c06-9d26-3900297edaff	OPENING_BALANCE	191.0000	0.0000	6.6400	1268.2400	MOVEMENT	d836dbbf-d7c5-4458-b4d6-99ad5db38f56	OB-2603-0004	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.421
49607988-9616-4d5f-b2dd-0d9b739ea95e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	OPENING_BALANCE	82.0000	0.0000	114.4800	9387.3600	MOVEMENT	aaa2041f-2216-4e49-89b4-12e322534ea7	OB-2603-0005	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.53
291dd904-359a-4126-afc9-dc13a6b54882	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	7d6aa943-58bb-4372-b67e-cd0749e40de7	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	OPENING_BALANCE	82.0000	0.0000	36.6600	3006.1200	MOVEMENT	b4780b77-ebe2-4763-b2b1-3986e5b4c96c	OB-2603-0006	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.642
f3bd88bb-e975-454c-aeb2-0e33d68aac81	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	61599286-8e27-4a13-8be5-f3d2d4eb7318	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	OPENING_BALANCE	67.0000	0.0000	75.7400	5074.5800	MOVEMENT	ecce41c5-440c-436d-920d-8e08ecd5a1b2	OB-2603-0007	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.749
1dd70184-0620-4e42-8548-db9cc63b3ebc	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	OPENING_BALANCE	30.0000	0.0000	418.8700	12566.1000	MOVEMENT	7c754025-74a0-4dc0-b9ea-ac339756f4cd	OB-2603-0008	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.866
0d9a411d-1a4d-43b8-aee2-c635c86c26ec	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	OPENING_BALANCE	20.0000	0.0000	418.8700	8377.4000	MOVEMENT	7c754025-74a0-4dc0-b9ea-ac339756f4cd	OB-2603-0008	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.877
1c2f16de-b19c-49de-894a-1b46f4c94467	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	OPENING_BALANCE	10.0000	0.0000	418.8700	4188.7000	MOVEMENT	7c754025-74a0-4dc0-b9ea-ac339756f4cd	OB-2603-0008	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.89
ad6cbd19-d0b9-41a0-a6da-b2b1680147c0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	db831357-4777-4182-b53c-cc765c88462c	OPENING_BALANCE	50.0000	0.0000	418.8700	20943.5000	MOVEMENT	7c754025-74a0-4dc0-b9ea-ac339756f4cd	OB-2603-0008	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.902
3a9cb4ff-afa3-456a-bc89-63dde2496758	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	OPENING_BALANCE	10.0000	0.0000	200.0000	2000.0000	MOVEMENT	6133c8da-d221-4d6b-a568-770bdbf03129	OB-2603-0009	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.015
e3c4ad1f-7606-4e17-8eb3-8c93f5d5768f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	OPENING_BALANCE	10.0000	0.0000	200.0000	2000.0000	MOVEMENT	6133c8da-d221-4d6b-a568-770bdbf03129	OB-2603-0009	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.028
82e2750a-bf81-4b57-a70d-27b4465e3415	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	OPENING_BALANCE	50.0000	0.0000	200.0000	10000.0000	MOVEMENT	6133c8da-d221-4d6b-a568-770bdbf03129	OB-2603-0009	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.04
9227b0df-6a63-49e7-a74f-d0f35552779a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	db831357-4777-4182-b53c-cc765c88462c	OPENING_BALANCE	10.0000	0.0000	200.0000	2000.0000	MOVEMENT	6133c8da-d221-4d6b-a568-770bdbf03129	OB-2603-0009	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.051
7c326aca-1cc7-4686-9bd2-7661157b6e57	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	OPENING_BALANCE	20.0000	0.0000	166.3000	3326.0000	MOVEMENT	89964ee2-223d-45d2-83c5-3dadd20e7655	OB-2603-0010	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.189
c4e8a4c4-b42e-4884-87c2-7855f063a7a4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	OPENING_BALANCE	50.0000	0.0000	166.3000	8315.0000	MOVEMENT	89964ee2-223d-45d2-83c5-3dadd20e7655	OB-2603-0010	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.2
3a27bfd7-bf77-4b57-bb4d-82b42a19faee	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	OPENING_BALANCE	25.0000	0.0000	166.3000	4157.5000	MOVEMENT	89964ee2-223d-45d2-83c5-3dadd20e7655	OB-2603-0010	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.213
4c29e419-852c-49df-80d7-0184ca6c5939	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	db831357-4777-4182-b53c-cc765c88462c	OPENING_BALANCE	12.0000	0.0000	166.3000	1995.6000	MOVEMENT	89964ee2-223d-45d2-83c5-3dadd20e7655	OB-2603-0010	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.226
d937cd63-5b5e-42d8-990b-91182be87cf0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	GET_PASS_OUT	0.0000	2.0000	418.8700	837.7400	GET_PASS	8c1592f4-13e4-4edb-ba95-c936c0760e85	GP-2026-00001	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:12.563
2fa9a9c3-eea1-475a-be67-698639e57c6f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	GET_PASS_OUT	0.0000	2.0000	418.8700	837.7400	GET_PASS	8c1592f4-13e4-4edb-ba95-c936c0760e85	GP-2026-00001	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:12.593
ab1f2bf0-fd12-4cdd-a31e-ef92d22eb49e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	RECEIVE	10.0000	0.0000	418.8700	4188.7000	GRN	b5a3fc06-2a88-40be-bc30-7c77484eb41c	55488848484	f	\N	GRN: 55488848484 | Supplier: Gulf Cleaning Supplies	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:29.541
011c28a5-436f-48cd-9ef5-f77f1ac733f0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	db831357-4777-4182-b53c-cc765c88462c	BREAKAGE	0.0000	5.0000	418.8700	2094.3500	BREAKAGE	dc48f334-2946-41a7-ad25-d801e400ab6c	BRK-2603-0001	f	\N	Breakage	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:49.068
797499fa-f190-4b36-8d71-8991a659bb8c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	db831357-4777-4182-b53c-cc765c88462c	COUNT_ADJUSTMENT	0.0000	5.0000	418.8700	2094.3500	STOCK_REPORT	fa2bcb74-2e34-424b-b6c4-3cf18faa60e3	SRPT-2603-0001	f	aa5be28f-5e61-49bf-9e32-284dbd4930c1	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:38:34.108
c398e7c3-648b-4fb5-afcd-ed3dbe333e1b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	996bab5e-6c3c-46d8-82e1-2d27bac08c39	4471aa5d-2df6-4283-8978-0312d5671e62	COUNT_ADJUSTMENT	0.0000	12.0000	20.3000	243.6000	STOCK_REPORT	d27f669f-c997-4cd5-9017-b9cdb2537606	SRPT-2603-0002	f	6bebbef7-71e4-4bd9-a548-f7a12ffd973a	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:42:32.269
86390823-5d27-4a4a-baf7-50f3e311884f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	be3cd42e-626d-4a7a-95a5-b3aaff464259	4471aa5d-2df6-4283-8978-0312d5671e62	COUNT_ADJUSTMENT	0.0000	92.0000	5.8800	540.9600	STOCK_REPORT	d27f669f-c997-4cd5-9017-b9cdb2537606	SRPT-2603-0002	f	6bebbef7-71e4-4bd9-a548-f7a12ffd973a	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:42:32.282
f601fa3d-0af9-475b-b319-3ff65a0e2979	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	COUNT_ADJUSTMENT	0.0000	2.0000	114.4800	228.9600	STOCK_REPORT	4637676b-2612-49d0-a2de-7b8dae17b97d	SRPT-2603-0003	f	a2330b78-dde8-4f4f-8ac2-6023239b7412	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:01:21.588
651a219e-35d7-4b63-94e5-ee26bed09407	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	7d6aa943-58bb-4372-b67e-cd0749e40de7	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	COUNT_ADJUSTMENT	0.0000	2.0000	36.6600	73.3200	STOCK_REPORT	4637676b-2612-49d0-a2de-7b8dae17b97d	SRPT-2603-0003	f	a2330b78-dde8-4f4f-8ac2-6023239b7412	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:01:21.6
94897514-cec4-4378-8f63-a9b6beb17fe8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	61599286-8e27-4a13-8be5-f3d2d4eb7318	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	COUNT_ADJUSTMENT	0.0000	7.0000	75.7400	530.1800	STOCK_REPORT	4637676b-2612-49d0-a2de-7b8dae17b97d	SRPT-2603-0003	f	a2330b78-dde8-4f4f-8ac2-6023239b7412	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:01:21.605
78993515-0c0d-48e1-ad80-3859e67df109	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	COUNT_ADJUSTMENT	0.0000	76.0000	4.2800	325.2800	STOCK_REPORT	025cf581-b148-46be-873f-1a49431d6c0c	SRPT-2603-0004	f	81724df7-269a-4f12-be04-41eb78688907	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:14:47.932
892654e0-b1e0-4e4d-a303-298f5d45e78f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	8bfcf489-60a1-4cf7-be17-63aa1295334f	4a439e1f-6691-4c06-9d26-3900297edaff	COUNT_ADJUSTMENT	0.0000	1.0000	6.6400	6.6400	STOCK_REPORT	025cf581-b148-46be-873f-1a49431d6c0c	SRPT-2603-0004	f	81724df7-269a-4f12-be04-41eb78688907	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:14:47.943
3838c08b-7f75-4a57-a0a8-716978cba9d1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	BREAKAGE	0.0000	1.0000	4.2800	4.2800	BREAKAGE	928dc673-951f-4031-b24b-bccb29fdf86e	BRK-2603-0002	f	\N	Breakage	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:16:02.624
f33ebe97-06e4-4613-927a-073156b33f3d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	COUNT_ADJUSTMENT	0.0000	99.0000	4.2800	423.7200	STOCK_REPORT	c6f0f271-a065-4cba-a56b-68cf1367982e	SRPT-2603-0005	f	1b748ae7-fa13-4576-b72c-0879b18e80c6	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:17:27.576
4257e5a0-d579-4ff1-94d8-50e155f4fa39	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	8bfcf489-60a1-4cf7-be17-63aa1295334f	4a439e1f-6691-4c06-9d26-3900297edaff	COUNT_ADJUSTMENT	0.0000	90.0000	6.6400	597.6000	STOCK_REPORT	c6f0f271-a065-4cba-a56b-68cf1367982e	SRPT-2603-0005	f	1b748ae7-fa13-4576-b72c-0879b18e80c6	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:17:27.58
443a87cd-ed0c-4d13-a867-70ea9b9abdc2	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	COUNT_ADJUSTMENT	100.0000	0.0000	4.2800	428.0000	STOCK_REPORT	42471023-b620-4bc1-b367-bdc46b1e58ac	SRPT-2603-0006	f	178ea66f-70b2-461f-839a-4cfeb780ae57	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:26:13.238
80dcd43f-7b49-461a-9538-ac6bcebecfb8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	GET_PASS_RETURN	2.0000	0.0000	418.8700	837.7400	GET_PASS_RETURN	c56438e0-9e49-4edc-b796-067c878c2caa	GP-2026-00001	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:45:16.686
3fbcbfc1-8ee8-4dfd-9f9b-c9ea6e34af2f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	GET_PASS_RETURN	2.0000	0.0000	418.8700	837.7400	GET_PASS_RETURN	59c590aa-12ef-4768-ae97-0b642438824d	GP-2026-00001	f	\N	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-20 01:45:16.713
\.


--
-- TOC entry 4171 (class 0 OID 82597)
-- Dependencies: 240
-- Data for Name: item_mappings; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.item_mappings (id, "tenantId", "futurelogItemCode", "futurelogItemName", "internalItemId", "createdBy", "updatedBy", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4155 (class 0 OID 82171)
-- Dependencies: 224
-- Data for Name: item_units; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.item_units (id, "tenantId", "itemId", "unitId", "unitType", "conversionRate", "isDefault") FROM stdin;
70561dd6-5cb7-49ef-9dcb-1de4e3b03ee5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	be3cd42e-626d-4a7a-95a5-b3aaff464259	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
85ce014c-8c85-40a9-8a79-db99c62a80ee	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	996bab5e-6c3c-46d8-82e1-2d27bac08c39	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
878cb4d0-9aa0-4045-b9ea-98a060b702ea	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
1285cf36-eef2-4282-8f58-665de7921ce6	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	8bfcf489-60a1-4cf7-be17-63aa1295334f	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
5f3002a9-2dd3-4bc6-894c-e39f4416ce76	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
f4a7b170-f15e-4f35-ac00-2d9df3c9c4ee	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	7d6aa943-58bb-4372-b67e-cd0749e40de7	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
140f025e-01cc-4c0e-b32f-c6f0c2166758	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	61599286-8e27-4a13-8be5-f3d2d4eb7318	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
2a58f3dc-8ae7-4e16-b482-ab76aa7b4091	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
61dce6cf-d44d-4147-9d7d-1797b31e6b9e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
d6325478-20f0-4ec2-9fd5-16ccc2e2d885	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	9a3364e3-f461-4968-8e81-f42973afea23	BASE	1.000000	t
\.


--
-- TOC entry 4157 (class 0 OID 82187)
-- Dependencies: 226
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.items (id, "tenantId", name, description, "categoryId", "subcategoryId", "supplierId", barcode, "unitPrice", "imageUrl", "isActive", "createdAt", "updatedAt", "defaultStoreId", "departmentId", "reorderPoint", "reorderQty", code) FROM stdin;
7d6aa943-58bb-4372-b67e-cd0749e40de7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Lid Dia 20 cm	\N	17441a0d-51da-41fe-a608-bb15c44c86c1	\N	20b73456-dad4-4b67-9914-d2c72ade213f	727613007804	36.6600	\N	t	2026-03-18 22:19:25.562	2026-03-18 22:19:25.562	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
61599286-8e27-4a13-8be5-f3d2d4eb7318	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Non-Stick Fryingpan Cm.24 Aluminium	\N	17441a0d-51da-41fe-a608-bb15c44c86c1	\N	20b73456-dad4-4b67-9914-d2c72ade213f	101577826647	75.7400	\N	t	2026-03-18 22:19:25.675	2026-03-18 22:19:25.675	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
1f012fcd-714d-4044-84ac-1947c36f4148	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs	\N	75cfe947-32bd-4562-9818-fec6fa0babe3	\N	20b73456-dad4-4b67-9914-d2c72ade213f	468749972186	418.8700	\N	t	2026-03-18 22:19:25.778	2026-03-18 22:19:25.778	db831357-4777-4182-b53c-cc765c88462c	285860a8-eea8-4c9c-b5b8-08be9ffe0d37	0	0	\N
88b57a91-fe18-4ca5-8061-cabb258e260b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs	\N	75cfe947-32bd-4562-9818-fec6fa0babe3	\N	20b73456-dad4-4b67-9914-d2c72ade213f	889293811130	200.0000	\N	t	2026-03-18 22:19:25.929	2026-03-18 22:19:25.929	db831357-4777-4182-b53c-cc765c88462c	285860a8-eea8-4c9c-b5b8-08be9ffe0d37	0	0	\N
b1c25d7e-507a-43a1-b457-df05464756bf	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Platter Duo - White China - 23.5x14x5cm - 6pcs	\N	75cfe947-32bd-4562-9818-fec6fa0babe3	\N	20b73456-dad4-4b67-9914-d2c72ade213f	645862480080	166.3000	\N	t	2026-03-18 22:19:26.088	2026-03-18 22:19:26.088	db831357-4777-4182-b53c-cc765c88462c	285860a8-eea8-4c9c-b5b8-08be9ffe0d37	0	0	\N
be3cd42e-626d-4a7a-95a5-b3aaff464259	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100	\N	e783a355-cfb9-4d20-93f5-6e8adcbda8c4	\N	20b73456-dad4-4b67-9914-d2c72ade213f	449521949251	5.8800	\N	t	2026-03-18 22:19:24.72	2026-03-18 22:19:24.72	4471aa5d-2df6-4283-8978-0312d5671e62	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
996bab5e-6c3c-46d8-82e1-2d27bac08c39	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	MR. CHEF * Insalatiera L\r\nSalad Bowl L\r\n162 cl - 54 3/4 oz\r\nh 97 mm - 3 3/4”\r\nMax Ø 222 mm - 8 3/4”	\N	e783a355-cfb9-4d20-93f5-6e8adcbda8c4	\N	20b73456-dad4-4b67-9914-d2c72ade213f	508041819053	20.3000	\N	t	2026-03-18 22:19:25.094	2026-03-18 22:19:25.094	4471aa5d-2df6-4283-8978-0312d5671e62	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
a0f461b7-bca4-4e84-8968-1009eaf108b2	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Demitasse Spoon	\N	ab9f1ea1-b0b5-4618-97d0-51504945effa	\N	20b73456-dad4-4b67-9914-d2c72ade213f	975558202071	4.2800	\N	t	2026-03-18 22:19:25.22	2026-03-18 22:19:25.22	4a439e1f-6691-4c06-9d26-3900297edaff	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
8bfcf489-60a1-4cf7-be17-63aa1295334f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Iced tea spoon	\N	ab9f1ea1-b0b5-4618-97d0-51504945effa	\N	20b73456-dad4-4b67-9914-d2c72ade213f	385344859861	6.6400	\N	t	2026-03-18 22:19:25.343	2026-03-18 22:19:25.343	4a439e1f-6691-4c06-9d26-3900297edaff	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	LOW CASSEROLE CM20 TENDER	\N	17441a0d-51da-41fe-a608-bb15c44c86c1	\N	20b73456-dad4-4b67-9914-d2c72ade213f	873236597448	114.4800	\N	t	2026-03-18 22:19:25.457	2026-03-18 22:19:25.457	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	b12e457a-3082-4954-aef5-a5d05074ff87	0	0	\N
\.


--
-- TOC entry 4192 (class 0 OID 87980)
-- Dependencies: 261
-- Data for Name: location_categories; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.location_categories (id, "locationId", "categoryId") FROM stdin;
484e1bdd-44d5-49d5-a6c0-feb0391c280a	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	17441a0d-51da-41fe-a608-bb15c44c86c1
4b673cf0-040f-4d26-8229-1148fd4943f5	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	75cfe947-32bd-4562-9818-fec6fa0babe3
ba9a87c5-3450-4e2c-bcc4-0b15ee4b826c	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	75cfe947-32bd-4562-9818-fec6fa0babe3
583ef38b-f14b-4813-a80b-83a7c6181b6b	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	75cfe947-32bd-4562-9818-fec6fa0babe3
8e760791-9be8-428e-9738-a7d6200f1301	db831357-4777-4182-b53c-cc765c88462c	75cfe947-32bd-4562-9818-fec6fa0babe3
700b9fd4-ae26-46a1-ac96-336c1285897b	4a439e1f-6691-4c06-9d26-3900297edaff	ab9f1ea1-b0b5-4618-97d0-51504945effa
5c8edb6c-cac2-45a2-87f5-406d2e914085	4471aa5d-2df6-4283-8978-0312d5671e62	e783a355-cfb9-4d20-93f5-6e8adcbda8c4
bfad1f5d-c5a8-43f9-910a-45fcbc18a17a	4471aa5d-2df6-4283-8978-0312d5671e62	1eacc4ed-92c3-4795-a84d-e40c1d90b46b
\.


--
-- TOC entry 4153 (class 0 OID 82157)
-- Dependencies: 222
-- Data for Name: location_users; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.location_users (id, "locationId", "userId") FROM stdin;
\.


--
-- TOC entry 4152 (class 0 OID 82147)
-- Dependencies: 221
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.locations (id, "tenantId", name, type, description, "isActive", "createdAt", "updatedAt", "departmentId") FROM stdin;
4471aa5d-2df6-4283-8978-0312d5671e62	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	HK.Store Floor 1	OUTLET_STORE		t	2026-03-11 22:59:11.047	2026-03-11 22:59:11.047	b12e457a-3082-4954-aef5-a5d05074ff87
4a439e1f-6691-4c06-9d26-3900297edaff	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	HK.Store Floor 2	OUTLET_STORE		t	2026-03-11 22:59:37.041	2026-03-11 22:59:37.041	b12e457a-3082-4954-aef5-a5d05074ff87
dbac990f-bd35-4ae7-81cc-c18b39c6cec1	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	HK.Store Floor 3	OUTLET_STORE		t	2026-03-11 23:00:05.527	2026-03-11 23:00:05.527	b12e457a-3082-4954-aef5-a5d05074ff87
db831357-4777-4182-b53c-cc765c88462c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	F&B Store	OUTLET_STORE		t	2026-03-11 23:00:28.168	2026-03-11 23:00:28.168	285860a8-eea8-4c9c-b5b8-08be9ffe0d37
a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	F&B.Horizon	OUTLET_STORE		t	2026-03-11 23:00:58.608	2026-03-11 23:00:58.608	285860a8-eea8-4c9c-b5b8-08be9ffe0d37
e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	F&B.Naya	OUTLET_STORE		t	2026-03-11 23:01:15.962	2026-03-11 23:01:15.962	285860a8-eea8-4c9c-b5b8-08be9ffe0d37
9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	F&B.Anardana	OUTLET_STORE		t	2026-03-11 23:01:31.335	2026-03-11 23:01:31.335	285860a8-eea8-4c9c-b5b8-08be9ffe0d37
\.


--
-- TOC entry 4160 (class 0 OID 82218)
-- Dependencies: 229
-- Data for Name: movement_documents; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.movement_documents (id, "tenantId", "documentNo", "movementType", status, "sourceLocationId", "destLocationId", "documentDate", "supplierId", department, reason, notes, "attachmentUrl", "createdBy", "postedAt", "voidedAt", "createdAt", "updatedAt") FROM stdin;
7a0d65cd-266f-4072-8936-89861d2304a4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0001	OPENING_BALANCE	POSTED	\N	4471aa5d-2df6-4283-8978-0312d5671e62	2026-03-18 22:19:24.761	\N	\N	\N	Opening Balance import for SESTRIERE DOF, 36 CL, Floz 12.2, Dia 92, Height 100	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.008	\N	2026-03-18 22:19:24.791	2026-03-18 22:19:25.009
8ebb499d-b08b-4933-9c20-039c1914eda2	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0002	OPENING_BALANCE	POSTED	\N	4471aa5d-2df6-4283-8978-0312d5671e62	2026-03-18 22:19:25.107	\N	\N	\N	Opening Balance import for MR. CHEF * Insalatiera L\r\nSalad Bowl L\r\n162 cl - 54 3/4 oz\r\nh 97 mm - 3 3/4”\r\nMax Ø 222 mm - 8 3/4”	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.197	\N	2026-03-18 22:19:25.115	2026-03-18 22:19:25.198
9952587d-d5c6-47c7-9510-5490a8ca6974	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0003	OPENING_BALANCE	POSTED	\N	4a439e1f-6691-4c06-9d26-3900297edaff	2026-03-18 22:19:25.23	\N	\N	\N	Opening Balance import for Demitasse Spoon	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.324	\N	2026-03-18 22:19:25.241	2026-03-18 22:19:25.325
d836dbbf-d7c5-4458-b4d6-99ad5db38f56	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0004	OPENING_BALANCE	POSTED	\N	4a439e1f-6691-4c06-9d26-3900297edaff	2026-03-18 22:19:25.354	\N	\N	\N	Opening Balance import for Iced tea spoon	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.436	\N	2026-03-18 22:19:25.366	2026-03-18 22:19:25.437
aaa2041f-2216-4e49-89b4-12e322534ea7	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0005	OPENING_BALANCE	POSTED	\N	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	2026-03-18 22:19:25.467	\N	\N	\N	Opening Balance import for LOW CASSEROLE CM20 TENDER	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.543	\N	2026-03-18 22:19:25.477	2026-03-18 22:19:25.544
b4780b77-ebe2-4763-b2b1-3986e5b4c96c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0006	OPENING_BALANCE	POSTED	\N	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	2026-03-18 22:19:25.575	\N	\N	\N	Opening Balance import for Lid Dia 20 cm	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.656	\N	2026-03-18 22:19:25.587	2026-03-18 22:19:25.657
ecce41c5-440c-436d-920d-8e08ecd5a1b2	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0007	OPENING_BALANCE	POSTED	\N	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	2026-03-18 22:19:25.687	\N	\N	\N	Opening Balance import for Non-Stick Fryingpan Cm.24 Aluminium	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.76	\N	2026-03-18 22:19:25.696	2026-03-18 22:19:25.761
7c754025-74a0-4dc0-b9ea-ac339756f4cd	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0008	OPENING_BALANCE	POSTED	\N	db831357-4777-4182-b53c-cc765c88462c	2026-03-18 22:19:25.788	\N	\N	\N	Opening Balance import for Bowl Duo - White China - 13x7x3.5cm - 0.08L - 12pcs	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:25.913	\N	2026-03-18 22:19:25.798	2026-03-18 22:19:25.915
6133c8da-d221-4d6b-a568-770bdbf03129	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0009	OPENING_BALANCE	POSTED	\N	db831357-4777-4182-b53c-cc765c88462c	2026-03-18 22:19:25.94	\N	\N	\N	Opening Balance import for Bowl Duo - White China - 22x7x11.7x5cm - 0.28L - 6pcs	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.065	\N	2026-03-18 22:19:25.95	2026-03-18 22:19:26.067
89964ee2-223d-45d2-83c5-3dadd20e7655	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	OB-2603-0010	OPENING_BALANCE	POSTED	\N	db831357-4777-4182-b53c-cc765c88462c	2026-03-18 22:19:26.1	\N	\N	\N	Opening Balance import for Platter Duo - White China - 23.5x14x5cm - 6pcs	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:19:26.241	\N	2026-03-18 22:19:26.113	2026-03-18 22:19:26.242
dc48f334-2946-41a7-ad25-d801e400ab6c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BRK-2603-0001	BREAKAGE	POSTED	db831357-4777-4182-b53c-cc765c88462c	\N	2026-03-18 00:00:00	\N	\N	Breakage	Breakage	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-18 22:34:49.043	\N	2026-03-18 22:32:54.23	2026-03-18 22:34:49.085
928dc673-951f-4031-b24b-bccb29fdf86e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	BRK-2603-0002	BREAKAGE	POSTED	4a439e1f-6691-4c06-9d26-3900297edaff	\N	2026-03-19 00:00:00	\N	\N	Breakage	Breakage	\N	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	2026-03-19 16:16:02.617	\N	2026-03-19 16:15:53.219	2026-03-19 16:16:02.631
\.


--
-- TOC entry 4161 (class 0 OID 82228)
-- Dependencies: 230
-- Data for Name: movement_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.movement_lines (id, "documentId", "itemId", "locationId", "unitId", "qtyRequested", "qtyInBaseUnit", "unitCost", "totalValue", notes) FROM stdin;
1a4161b4-9320-4b08-b787-a149097b854e	7a0d65cd-266f-4072-8936-89861d2304a4	be3cd42e-626d-4a7a-95a5-b3aaff464259	4471aa5d-2df6-4283-8978-0312d5671e62	\N	892.0000	892.0000	5.8800	5244.9600	\N
04d7dca9-d934-487e-b755-b73bff65ee4a	8ebb499d-b08b-4933-9c20-039c1914eda2	996bab5e-6c3c-46d8-82e1-2d27bac08c39	4471aa5d-2df6-4283-8978-0312d5671e62	\N	112.0000	112.0000	20.3000	2273.6000	\N
dd41973a-7130-4d7e-8da0-8fb6f4b4b04c	9952587d-d5c6-47c7-9510-5490a8ca6974	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	\N	876.0000	876.0000	4.2800	3749.2800	\N
a038a427-ce43-46e6-a3b3-80c932626c8b	d836dbbf-d7c5-4458-b4d6-99ad5db38f56	8bfcf489-60a1-4cf7-be17-63aa1295334f	4a439e1f-6691-4c06-9d26-3900297edaff	\N	191.0000	191.0000	6.6400	1268.2400	\N
8febace7-66d7-4b8e-ab18-3c9256e3cd2d	aaa2041f-2216-4e49-89b4-12e322534ea7	ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	\N	82.0000	82.0000	114.4800	9387.3600	\N
284ea91e-b68f-4ea0-8016-f22f9ffddbf1	b4780b77-ebe2-4763-b2b1-3986e5b4c96c	7d6aa943-58bb-4372-b67e-cd0749e40de7	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	\N	82.0000	82.0000	36.6600	3006.1200	\N
2cc0e006-2916-46c2-8b56-cf5b49538985	ecce41c5-440c-436d-920d-8e08ecd5a1b2	61599286-8e27-4a13-8be5-f3d2d4eb7318	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	\N	67.0000	67.0000	75.7400	5074.5800	\N
bb70e940-e135-4668-beff-2eb63e6182d8	7c754025-74a0-4dc0-b9ea-ac339756f4cd	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	\N	30.0000	30.0000	418.8700	12566.1000	\N
a83ac6b1-ac29-4509-af31-3682196d3017	7c754025-74a0-4dc0-b9ea-ac339756f4cd	1f012fcd-714d-4044-84ac-1947c36f4148	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	\N	20.0000	20.0000	418.8700	8377.4000	\N
234c89c2-d8ba-486f-8d84-ceb9cafbec7d	7c754025-74a0-4dc0-b9ea-ac339756f4cd	1f012fcd-714d-4044-84ac-1947c36f4148	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	\N	10.0000	10.0000	418.8700	4188.7000	\N
d0fa868f-9a9c-454a-a8f2-e95727b3810b	7c754025-74a0-4dc0-b9ea-ac339756f4cd	1f012fcd-714d-4044-84ac-1947c36f4148	db831357-4777-4182-b53c-cc765c88462c	\N	50.0000	50.0000	418.8700	20943.5000	\N
b3ea2941-0b53-4a7b-b928-80fef85d39bd	6133c8da-d221-4d6b-a568-770bdbf03129	88b57a91-fe18-4ca5-8061-cabb258e260b	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	\N	10.0000	10.0000	200.0000	2000.0000	\N
3ddcb427-5aae-4f80-8009-7bccd00cd553	6133c8da-d221-4d6b-a568-770bdbf03129	88b57a91-fe18-4ca5-8061-cabb258e260b	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	\N	10.0000	10.0000	200.0000	2000.0000	\N
4713d116-bffa-4549-803d-011de33cca5d	6133c8da-d221-4d6b-a568-770bdbf03129	88b57a91-fe18-4ca5-8061-cabb258e260b	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	\N	50.0000	50.0000	200.0000	10000.0000	\N
e91d9547-ee06-4ff6-a15b-a25cf6d32c97	6133c8da-d221-4d6b-a568-770bdbf03129	88b57a91-fe18-4ca5-8061-cabb258e260b	db831357-4777-4182-b53c-cc765c88462c	\N	10.0000	10.0000	200.0000	2000.0000	\N
7188cd8e-682c-447c-a94d-0786a9183f1e	89964ee2-223d-45d2-83c5-3dadd20e7655	b1c25d7e-507a-43a1-b457-df05464756bf	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	\N	20.0000	20.0000	166.3000	3326.0000	\N
d8c0940b-9023-4173-a702-dd697fbc0751	89964ee2-223d-45d2-83c5-3dadd20e7655	b1c25d7e-507a-43a1-b457-df05464756bf	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	\N	50.0000	50.0000	166.3000	8315.0000	\N
ba620de6-662e-4083-a2d2-92df201ef433	89964ee2-223d-45d2-83c5-3dadd20e7655	b1c25d7e-507a-43a1-b457-df05464756bf	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	\N	25.0000	25.0000	166.3000	4157.5000	\N
27ed28dc-df12-481b-bd5b-e3eab9dfb00d	89964ee2-223d-45d2-83c5-3dadd20e7655	b1c25d7e-507a-43a1-b457-df05464756bf	db831357-4777-4182-b53c-cc765c88462c	\N	12.0000	12.0000	166.3000	1995.6000	\N
2fcf8320-6f88-4a03-bb16-f0363a770f32	dc48f334-2946-41a7-ad25-d801e400ab6c	1f012fcd-714d-4044-84ac-1947c36f4148	db831357-4777-4182-b53c-cc765c88462c	\N	5.0000	5.0000	0.0000	0.0000	\N
a618f53d-42e6-4164-a301-fca6a19e4e46	928dc673-951f-4031-b24b-bccb29fdf86e	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	\N	1.0000	1.0000	0.0000	0.0000	\N
\.


--
-- TOC entry 4184 (class 0 OID 83099)
-- Dependencies: 253
-- Data for Name: period_closes; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.period_closes (id, "tenantId", year, month, status, "closedAt", "closedBy", notes, "createdAt") FROM stdin;
\.


--
-- TOC entry 4185 (class 0 OID 83108)
-- Dependencies: 254
-- Data for Name: period_snapshots; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.period_snapshots (id, "periodCloseId", "itemId", "locationId", "closingQty", "closingValue", "wacUnitCost") FROM stdin;
\.


--
-- TOC entry 4149 (class 0 OID 82121)
-- Dependencies: 218
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.refresh_tokens (id, "userId", token, "expiresAt", "revokedAt", "ipAddress", "userAgent", "createdAt") FROM stdin;
f1e60c85-7f04-4dba-905f-4094ffc3ebf8	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzI2OTMyOCwiZXhwIjoxNzczODc0MTI4fQ.vrxBiPJiHv9IKj27y6L0iHbQo3RdSERuxIf-aBC5Nzg	2026-03-18 22:48:48.908	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-11 22:48:48.91
1a0e3d18-d298-4e80-848c-b37060a50d0e	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzI2OTYyMCwiZXhwIjoxNzczODc0NDIwfQ.Vo0Ky7uY1HgwX4oP1eVY8PN2paSzZeIfo2ql6MSNh6Q	2026-03-18 22:53:40.776	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-11 22:53:40.778
f35976d2-3737-4851-8512-bcdf5db3be65	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzMzMTIwMiwiZXhwIjoxNzczOTM2MDAyfQ.SvqSl0AdLERIjyRag63pNMjnWuAmSP7pQ0mEs8g6cBE	2026-03-19 16:00:02.043	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-12 16:00:02.045
5317d7b5-69cb-4e4b-9003-bcc8f5df415d	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzQyNzA4NCwiZXhwIjoxNzc0MDMxODg0fQ.I0MhzBsOcGsTmCoUbpYO08oqXSWw3B11yV9aZPMStZA	2026-03-20 18:38:04.804	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-13 18:38:04.807
58ed4a63-cd52-4b58-8deb-2be06c4487b8	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzQyNzEwMiwiZXhwIjoxNzc0MDMxOTAyfQ.DADUYpFtf1ORJru10K0NTEoBgKzz8TmEV_yaGuQBhZs	2026-03-20 18:38:22.986	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-13 18:38:22.99
c9c167e7-c419-4898-83ac-686fc85f3c4b	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzQyOTI2NSwiZXhwIjoxNzc0MDM0MDY1fQ.vR0dg4dmBFK0rN-c4v0Bt4adJIjF8wiQuIOKl3ZLm8k	2026-03-20 19:14:25.856	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-13 19:14:25.858
64f05640-7f34-488d-8214-96fe62fb4270	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzUwODk0NiwiZXhwIjoxNzc0MTEzNzQ2fQ.53Yg0l06-XO0617VMCcrj0vXY7r8mpdw59vOKj2yw0s	2026-03-21 17:22:26.145	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-14 17:22:26.146
62d794a8-29e4-4e2a-8df8-efae07382098	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzUwOTIyMSwiZXhwIjoxNzc0MTE0MDIxfQ.rdsIuokRhUXNdS5QEepWIa3pMEdt7V8ftpFL8zIMSN4	2026-03-21 17:27:01.284	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-03-14 17:27:01.285
fcea3633-57eb-435a-83c0-de69d08e7376	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzUwOTI3MSwiZXhwIjoxNzc0MTE0MDcxfQ.d0HAuuv0YlNPs8XuBDSKWkQsL8jgb-xum8js2Cj6PZY	2026-03-21 17:27:51.996	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-14 17:27:51.998
241869ad-50a3-4697-8190-e6c22e250891	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzUyMjkzNiwiZXhwIjoxNzc0MTI3NzM2fQ.DRpYCNff1Sc6f-LOE-clowP1Kt9d2oytI_wmOyZqS4E	2026-03-21 21:15:36.544	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-14 21:15:36.546
80b06495-d00e-4097-8cb0-b1df1412a98f	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzUyNDQ4NiwiZXhwIjoxNzgxMzAwNDg2fQ.a6wfC3Aj3w1HvYrzbjG8BGKnNDGJNoPpgxz0Rk4-myc	2026-06-12 21:41:26.987	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-14 21:41:26.989
004232a3-36ff-4e18-88c9-52f4d161d317	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzUyNzcwNCwiZXhwIjoxNzgxMzAzNzA0fQ.4PKb5WNPuwkK80aLe_8m-d2drPCu-Zkqn7slougYmGs	2026-06-12 22:35:04.309	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	2026-03-14 22:35:04.31
7340fb21-97e9-4513-b140-3c1b6bd0554c	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3MzY4OTExMywiZXhwIjoxNzgxNDY1MTEzfQ.DbSrDpnUCUIkbl9iuRQNzO7GxGhu7IzPzi_bZJI66Ws	2026-06-14 19:25:13.343	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-03-16 19:25:13.352
5ba82a4d-d1f8-4932-80d3-faf5ff92dc22	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZDJiMTI4NS00M2Y4LTRhZTQtYjFlZS02YzU0YjgyZjZiM2MiLCJ0ZW5hbnRJZCI6IjU2ZTI2YzE5LWFmZjQtNGZkOS04ZDQzLWEzZWQ0ZGRlODlkNSIsImlhdCI6MTc3Mzk0NDQ2NSwiZXhwIjoxNzgxNzIwNDY1fQ.ZJXc8DsLc4O90nwpowqmyvEWfXPnkjKCCSa0voEkSU8	2026-06-17 18:21:05.041	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	2026-03-19 18:21:05.042
\.


--
-- TOC entry 4188 (class 0 OID 83141)
-- Dependencies: 257
-- Data for Name: saved_stock_report_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.saved_stock_report_lines (id, "reportId", "itemId", "openingQty", "openingValue", "inwardQty", "inwardValue", "outwardQty", "outwardValue", "closingQty", "closingValue", "outOnPassQty", breakages, "grnQty", "grnValue") FROM stdin;
7e24d6b3-7cff-42b2-9b7e-d9576100f739	fa2bcb74-2e34-424b-b6c4-3cf18faa60e3	88b57a91-fe18-4ca5-8061-cabb258e260b	80.0000	16000.0000	80.0000	16000.0000	0.0000	0.0000	80.0000	0.0000	0.0000	0.0000	0.0000	0.0000
fd1212a3-c552-44fa-a7b3-07ecf071f1e3	fa2bcb74-2e34-424b-b6c4-3cf18faa60e3	b1c25d7e-507a-43a1-b457-df05464756bf	107.0000	17794.1000	107.0000	17794.1000	0.0000	0.0000	107.0000	0.0000	0.0000	0.0000	0.0000	0.0000
b2314f8a-519a-452b-8e21-94fe5a044377	fa2bcb74-2e34-424b-b6c4-3cf18faa60e3	1f012fcd-714d-4044-84ac-1947c36f4148	110.0000	46075.7000	106.0000	44400.2200	-5.0000	-2094.3500	111.0000	0.0000	4.0000	0.0000	0.0000	0.0000
0c19d34c-53a7-41ad-8926-3a5b8201dfe1	d27f669f-c997-4cd5-9017-b9cdb2537606	996bab5e-6c3c-46d8-82e1-2d27bac08c39	112.0000	2273.6000	100.0000	2030.0000	-12.0000	-243.6000	112.0000	0.0000	0.0000	0.0000	0.0000	0.0000
4da8e79c-9dc0-4f35-b99f-88f01cd6c077	d27f669f-c997-4cd5-9017-b9cdb2537606	be3cd42e-626d-4a7a-95a5-b3aaff464259	892.0000	5244.9600	800.0000	4704.0000	-92.0000	-540.9600	892.0000	0.0000	0.0000	0.0000	0.0000	0.0000
33e17355-c858-40b3-84d9-e90e5d5b037d	4637676b-2612-49d0-a2de-7b8dae17b97d	ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	82.0000	9387.3600	80.0000	9158.4000	-2.0000	-228.9600	82.0000	0.0000	0.0000	0.0000	0.0000	0.0000
8ed79e61-ba2b-4f46-8499-d1d7a6522d98	4637676b-2612-49d0-a2de-7b8dae17b97d	7d6aa943-58bb-4372-b67e-cd0749e40de7	82.0000	3006.1200	80.0000	2932.8000	-2.0000	-73.3200	82.0000	0.0000	0.0000	0.0000	0.0000	0.0000
a83d1b4e-ad89-41f1-ad57-f589b6dce8e8	4637676b-2612-49d0-a2de-7b8dae17b97d	61599286-8e27-4a13-8be5-f3d2d4eb7318	67.0000	5074.5800	60.0000	4544.4000	-7.0000	-530.1800	67.0000	0.0000	0.0000	0.0000	0.0000	0.0000
3ecd6176-0dec-4162-99c1-42d94d6e01b3	025cf581-b148-46be-873f-1a49431d6c0c	a0f461b7-bca4-4e84-8968-1009eaf108b2	876.0000	3749.2800	800.0000	3424.0000	-76.0000	-325.2800	876.0000	0.0000	0.0000	0.0000	0.0000	0.0000
18b2b2e5-51e2-402f-af19-5310addaed43	025cf581-b148-46be-873f-1a49431d6c0c	8bfcf489-60a1-4cf7-be17-63aa1295334f	191.0000	1268.2400	190.0000	1261.6000	-1.0000	-6.6400	191.0000	0.0000	0.0000	0.0000	0.0000	0.0000
49cd1aed-713d-4d36-a465-e211d17fffcf	c6f0f271-a065-4cba-a56b-68cf1367982e	a0f461b7-bca4-4e84-8968-1009eaf108b2	876.0000	3749.2800	700.0000	2996.0000	-99.0000	-423.7200	799.0000	0.0000	0.0000	0.0000	0.0000	0.0000
fdade783-1a58-4668-bccb-87be014c449a	c6f0f271-a065-4cba-a56b-68cf1367982e	8bfcf489-60a1-4cf7-be17-63aa1295334f	191.0000	1268.2400	100.0000	664.0000	-90.0000	-597.6000	190.0000	0.0000	0.0000	0.0000	0.0000	0.0000
70320926-9790-4300-9f12-b8ab4a7e7338	42471023-b620-4bc1-b367-bdc46b1e58ac	a0f461b7-bca4-4e84-8968-1009eaf108b2	876.0000	3749.2800	800.0000	3424.0000	100.0000	428.0000	700.0000	0.0000	0.0000	1.0000	0.0000	0.0000
c954dac1-eb3d-476e-a134-ac9ea5335d13	42471023-b620-4bc1-b367-bdc46b1e58ac	8bfcf489-60a1-4cf7-be17-63aa1295334f	191.0000	1268.2400	100.0000	664.0000	0.0000	0.0000	100.0000	0.0000	0.0000	0.0000	0.0000	0.0000
\.


--
-- TOC entry 4189 (class 0 OID 83154)
-- Dependencies: 258
-- Data for Name: saved_stock_report_location_qtys; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.saved_stock_report_location_qtys (id, "lineId", "locationId", "bookQty", "countedQty", "varianceQty") FROM stdin;
10ee208f-b365-4ba5-a0b7-b10468e141af	b2314f8a-519a-452b-8e21-94fe5a044377	db831357-4777-4182-b53c-cc765c88462c	45.0000	40.0000	-5.0000
015ff2d3-a5b4-4a90-a0cc-46578745ffe3	b2314f8a-519a-452b-8e21-94fe5a044377	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	10.0000	10.0000	0.0000
b179a669-6f50-4c36-97e8-0fc695393971	b2314f8a-519a-452b-8e21-94fe5a044377	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	20.0000	20.0000	0.0000
ef9e05a2-dfaa-4947-bf50-63006778a3c9	b2314f8a-519a-452b-8e21-94fe5a044377	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	36.0000	36.0000	0.0000
a0b3fb6e-4b49-40cc-932d-bcd3e83f8aa1	7e24d6b3-7cff-42b2-9b7e-d9576100f739	db831357-4777-4182-b53c-cc765c88462c	10.0000	10.0000	0.0000
60aea5fd-c012-4de4-a947-be09cf5fb0b3	7e24d6b3-7cff-42b2-9b7e-d9576100f739	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	50.0000	50.0000	0.0000
dc3a1229-f0f0-4b6c-9b9c-9620018645eb	7e24d6b3-7cff-42b2-9b7e-d9576100f739	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	10.0000	10.0000	0.0000
aacd3d22-ef48-4f07-8079-9b3645418bee	7e24d6b3-7cff-42b2-9b7e-d9576100f739	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	10.0000	10.0000	0.0000
a7c3c530-63bc-4e83-bfb3-c3a884c4ceeb	fd1212a3-c552-44fa-a7b3-07ecf071f1e3	db831357-4777-4182-b53c-cc765c88462c	12.0000	12.0000	0.0000
b60a58fa-9bee-467b-b0d1-2deebde057c5	fd1212a3-c552-44fa-a7b3-07ecf071f1e3	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	25.0000	25.0000	0.0000
58e452e9-e63f-4677-b5b9-ff7ea8958ae2	fd1212a3-c552-44fa-a7b3-07ecf071f1e3	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	50.0000	50.0000	0.0000
e80e5e07-ec80-4b3b-ad63-0519270eac8d	fd1212a3-c552-44fa-a7b3-07ecf071f1e3	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	20.0000	20.0000	0.0000
46dc10ac-0f9e-4507-b222-c88d549620b6	0c19d34c-53a7-41ad-8926-3a5b8201dfe1	4471aa5d-2df6-4283-8978-0312d5671e62	112.0000	100.0000	-12.0000
e902d1ce-7ec1-4017-9261-2f483b5e87c7	4da8e79c-9dc0-4f35-b99f-88f01cd6c077	4471aa5d-2df6-4283-8978-0312d5671e62	892.0000	800.0000	-92.0000
affbb2e5-5928-4aac-a654-e44c929b3c7b	33e17355-c858-40b3-84d9-e90e5d5b037d	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	82.0000	80.0000	-2.0000
29eb21e1-006c-4c66-8531-ea646f9336d7	8ed79e61-ba2b-4f46-8499-d1d7a6522d98	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	82.0000	80.0000	-2.0000
f0489a03-52cb-48bb-a595-d49b134a43aa	a83d1b4e-ad89-41f1-ad57-f589b6dce8e8	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	67.0000	60.0000	-7.0000
acec286e-d3bf-4e7b-98e2-97aefe774771	3ecd6176-0dec-4162-99c1-42d94d6e01b3	4a439e1f-6691-4c06-9d26-3900297edaff	876.0000	800.0000	-76.0000
e5e614e9-ec99-4442-b979-e546d42e4748	18b2b2e5-51e2-402f-af19-5310addaed43	4a439e1f-6691-4c06-9d26-3900297edaff	191.0000	190.0000	-1.0000
5d497a79-7d98-4fca-bf64-8ae19398a21b	49cd1aed-713d-4d36-a465-e211d17fffcf	4a439e1f-6691-4c06-9d26-3900297edaff	799.0000	700.0000	-99.0000
f4dacac0-4fb8-4757-b269-f5045cf0dff3	fdade783-1a58-4668-bccb-87be014c449a	4a439e1f-6691-4c06-9d26-3900297edaff	190.0000	100.0000	-90.0000
713e147f-f9d1-495f-b0f8-90efaa6bb139	70320926-9790-4300-9f12-b8ab4a7e7338	4a439e1f-6691-4c06-9d26-3900297edaff	700.0000	800.0000	100.0000
1ebe4b4e-5889-49d0-b71c-da7992bed43e	c954dac1-eb3d-476e-a134-ac9ea5335d13	4a439e1f-6691-4c06-9d26-3900297edaff	100.0000	100.0000	0.0000
\.


--
-- TOC entry 4187 (class 0 OID 83130)
-- Dependencies: 256
-- Data for Name: saved_stock_reports; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.saved_stock_reports (id, "tenantId", "reportNo", "locationId", status, "dateGenerated", "totalValue", notes, "createdBy", "approvalRequestId", "postedAt", "createdAt", "updatedAt") FROM stdin;
fa2bcb74-2e34-424b-b6c4-3cf18faa60e3	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SRPT-2603-0001	db831357-4777-4182-b53c-cc765c88462c	POSTED	2026-03-18 22:38:07.507	2094.3500	Draft generated for year 2026	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	aa5be28f-5e61-49bf-9e32-284dbd4930c1	2026-03-18 22:38:34.131	2026-03-18 22:38:07.507	2026-03-19 16:07:17.008
d27f669f-c997-4cd5-9017-b9cdb2537606	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SRPT-2603-0002	4471aa5d-2df6-4283-8978-0312d5671e62	POSTED	2026-03-18 22:39:56.742	784.5600	Draft generated for year 2026	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	6bebbef7-71e4-4bd9-a548-f7a12ffd973a	2026-03-18 22:42:32.289	2026-03-18 22:39:56.742	2026-03-19 16:07:17.013
4637676b-2612-49d0-a2de-7b8dae17b97d	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SRPT-2603-0003	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	POSTED	2026-03-19 16:01:11.551	832.4600	Draft generated for year 2026	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	a2330b78-dde8-4f4f-8ac2-6023239b7412	2026-03-19 16:01:21.607	2026-03-19 16:01:11.551	2026-03-19 16:07:17.016
025cf581-b148-46be-873f-1a49431d6c0c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SRPT-2603-0004	4a439e1f-6691-4c06-9d26-3900297edaff	POSTED	2026-03-19 16:12:31.295	331.9200	Draft generated for year 2026	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	81724df7-269a-4f12-be04-41eb78688907	2026-03-19 16:14:47.955	2026-03-19 16:12:31.295	2026-03-19 16:14:47.947
c6f0f271-a065-4cba-a56b-68cf1367982e	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SRPT-2603-0005	4a439e1f-6691-4c06-9d26-3900297edaff	POSTED	2026-03-19 16:16:34.979	1021.3200	Draft generated for year 2026	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	1b748ae7-fa13-4576-b72c-0879b18e80c6	2026-03-19 16:17:27.592	2026-03-19 16:16:34.979	2026-03-19 16:17:27.583
42471023-b620-4bc1-b367-bdc46b1e58ac	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	SRPT-2603-0006	4a439e1f-6691-4c06-9d26-3900297edaff	POSTED	2026-03-19 16:26:05.46	428.0000	Draft generated for year 2026	bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	178ea66f-70b2-461f-839a-4cfeb780ae57	2026-03-19 16:26:13.246	2026-03-19 16:26:05.46	2026-03-19 16:26:13.248
\.


--
-- TOC entry 4159 (class 0 OID 82210)
-- Dependencies: 228
-- Data for Name: stock_balances; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.stock_balances ("tenantId", "itemId", "locationId", "qtyOnHand", "wacUnitCost", "lastUpdated", "maxQty", "minQty", "reorderPoint") FROM stdin;
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	7d6aa943-58bb-4372-b67e-cd0749e40de7	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	80.0000	36.6600	2026-03-19 16:01:21.602	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	61599286-8e27-4a13-8be5-f3d2d4eb7318	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	60.0000	75.7400	2026-03-19 16:01:21.607	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	20.0000	418.8700	2026-03-18 22:19:25.882	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	10.0000	418.8700	2026-03-18 22:19:25.894	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	10.0000	200.0000	2026-03-18 22:19:26.02	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	10.0000	200.0000	2026-03-18 22:19:26.033	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	50.0000	200.0000	2026-03-18 22:19:26.044	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	20.0000	166.3000	2026-03-18 22:19:26.193	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	a51036f2-71fd-4b0b-8fdc-aa44d4e64c9f	50.0000	166.3000	2026-03-18 22:19:26.205	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	9b12ae12-4e3a-46fc-aa39-6fc5600aa0d8	25.0000	166.3000	2026-03-18 22:19:26.218	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	8bfcf489-60a1-4cf7-be17-63aa1295334f	4a439e1f-6691-4c06-9d26-3900297edaff	100.0000	6.6400	2026-03-19 16:17:27.582	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	a0f461b7-bca4-4e84-8968-1009eaf108b2	4a439e1f-6691-4c06-9d26-3900297edaff	800.0000	4.2800	2026-03-19 16:26:13.244	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	88b57a91-fe18-4ca5-8061-cabb258e260b	db831357-4777-4182-b53c-cc765c88462c	10.0000	200.0000	2026-03-18 22:26:28.232	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	b1c25d7e-507a-43a1-b457-df05464756bf	db831357-4777-4182-b53c-cc765c88462c	12.0000	166.3000	2026-03-18 22:26:28.238	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	e6d1676e-69b6-43c5-8a6c-0f3a0b3e0bad	40.0000	418.8700	2026-03-20 01:45:16.717	0.0000	0.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1f012fcd-714d-4044-84ac-1947c36f4148	db831357-4777-4182-b53c-cc765c88462c	40.0000	418.8700	2026-03-18 22:38:34.126	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	996bab5e-6c3c-46d8-82e1-2d27bac08c39	4471aa5d-2df6-4283-8978-0312d5671e62	100.0000	20.3000	2026-03-18 22:42:32.275	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	be3cd42e-626d-4a7a-95a5-b3aaff464259	4471aa5d-2df6-4283-8978-0312d5671e62	800.0000	5.8800	2026-03-18 22:42:32.286	0.0000	5.0000	0.0000
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ac3a5b2e-6653-41fc-b2fa-6d180dd576dd	dbac990f-bd35-4ae7-81cc-c18b39c6cec1	80.0000	114.4800	2026-03-19 16:01:21.596	0.0000	5.0000	0.0000
\.


--
-- TOC entry 4167 (class 0 OID 82283)
-- Dependencies: 236
-- Data for Name: stock_count_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.stock_count_lines (id, "sessionId", "itemId", "bookQty", "countedQty", "varianceQty", "wacUnitCost", "varianceValue", notes, "qtyOnLoan") FROM stdin;
\.


--
-- TOC entry 4166 (class 0 OID 82274)
-- Dependencies: 235
-- Data for Name: stock_count_sessions; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.stock_count_sessions (id, "tenantId", "locationId", "sessionNo", "countDate", notes, "createdBy", "createdAt", "approvalRequestId", "movementDocumentId", "postedAt", "snapshotAt", "updatedAt", status) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 82815)
-- Dependencies: 246
-- Data for Name: store_issue_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.store_issue_lines (id, "issueId", "requisitionLineId", "itemId", "uomId", "issuedQty", "unitCost", "totalValue") FROM stdin;
\.


--
-- TOC entry 4176 (class 0 OID 82784)
-- Dependencies: 245
-- Data for Name: store_issues; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.store_issues (id, "tenantId", "issueNo", "requisitionId", "issueDate", "issuedBy", status, notes, "attachmentUrl", "postedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4175 (class 0 OID 82759)
-- Dependencies: 244
-- Data for Name: store_requisition_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.store_requisition_lines (id, "requisitionId", "itemId", "uomId", "requestedQty", "totalIssuedQty", notes) FROM stdin;
\.


--
-- TOC entry 4174 (class 0 OID 82717)
-- Dependencies: 243
-- Data for Name: store_requisitions; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.store_requisitions (id, "tenantId", "requisitionNo", "departmentName", "locationId", "requestedBy", "approvedBy", "rejectedBy", "requestDate", "requiredBy", status, remarks, "rejectionReason", "approvedAt", "fullyIssuedAt", "closedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4179 (class 0 OID 82914)
-- Dependencies: 248
-- Data for Name: store_transfer_lines; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.store_transfer_lines (id, "transferId", "itemId", "uomId", "requestedQty", "receivedQty", "unitCost", "totalValue", notes) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 82861)
-- Dependencies: 247
-- Data for Name: store_transfers; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.store_transfers (id, "tenantId", "transferNo", "sourceLocationId", "destLocationId", "requestedBy", "approvedBy", "rejectedBy", "receivedBy", "transferDate", "requiredBy", status, reason, "rejectionReason", notes, "approvedAt", "dispatchedAt", "receivedAt", "closedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4151 (class 0 OID 82138)
-- Dependencies: 220
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.subcategories (id, "tenantId", "categoryId", name, description, "isActive", "createdAt", "updatedAt") FROM stdin;
31720724-48a9-44a6-89aa-8fdaa5a5d222	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1eacc4ed-92c3-4795-a84d-e40c1d90b46b	Bed Sheets	\N	t	2026-03-11 22:48:31.61	2026-03-11 22:48:31.61
803fc74f-ef9b-4524-a2b8-3e845dc67e47	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1eacc4ed-92c3-4795-a84d-e40c1d90b46b	Pillowcases	\N	t	2026-03-11 22:48:31.623	2026-03-11 22:48:31.623
531cd4fb-a5c9-4db5-827c-06799c9839e6	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1eacc4ed-92c3-4795-a84d-e40c1d90b46b	Towels	\N	t	2026-03-11 22:48:31.631	2026-03-11 22:48:31.631
72aaa386-44b8-490f-8cf1-b84dc4a6241b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	1eacc4ed-92c3-4795-a84d-e40c1d90b46b	Bath Robes	\N	t	2026-03-11 22:48:31.638	2026-03-11 22:48:31.638
468dbc91-2112-4330-916e-0161d0afdf1c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	17441a0d-51da-41fe-a608-bb15c44c86c1	Toiletries	\N	t	2026-03-11 22:48:31.654	2026-03-11 22:48:31.654
7dc14db0-abd2-496c-9d52-0a53d5c17692	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	17441a0d-51da-41fe-a608-bb15c44c86c1	Room Accessories	\N	t	2026-03-11 22:48:31.663	2026-03-11 22:48:31.663
9a057eda-868f-4c08-b641-c2a5dd4d443b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	17441a0d-51da-41fe-a608-bb15c44c86c1	Minibar	\N	t	2026-03-11 22:48:31.672	2026-03-11 22:48:31.672
91a8e08c-9eb7-4205-b903-02d2ab487427	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	e783a355-cfb9-4d20-93f5-6e8adcbda8c4	Chemicals	\N	t	2026-03-11 22:48:31.701	2026-03-11 22:48:31.701
9c540b81-267e-4a09-8f6a-fde6e1e2d72a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	e783a355-cfb9-4d20-93f5-6e8adcbda8c4	Cleaning Tools	\N	t	2026-03-11 22:48:31.711	2026-03-11 22:48:31.711
180c0ce7-be86-462f-a2cb-135563206d2b	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	e783a355-cfb9-4d20-93f5-6e8adcbda8c4	Waste Bags	\N	t	2026-03-11 22:48:31.721	2026-03-11 22:48:31.721
f918a229-4861-40aa-92cc-e86723f7053a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ab9f1ea1-b0b5-4618-97d0-51504945effa	Tableware	\N	t	2026-03-11 22:48:31.742	2026-03-11 22:48:31.742
129f7b30-b8fa-45dc-a302-9d8960dccf82	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ab9f1ea1-b0b5-4618-97d0-51504945effa	Glassware	\N	t	2026-03-11 22:48:31.749	2026-03-11 22:48:31.749
e882a099-4f37-459a-a07d-28b5eedf29d8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ab9f1ea1-b0b5-4618-97d0-51504945effa	Kitchen Tools	\N	t	2026-03-11 22:48:31.759	2026-03-11 22:48:31.759
3b5f44e0-4e52-4a0c-8b25-a1ffab1deeeb	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ab9f1ea1-b0b5-4618-97d0-51504945effa	Cutlery	\N	t	2026-03-11 22:48:31.77	2026-03-11 22:48:31.77
0538c60f-331e-425c-beae-dda2714c82c5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	bcb28ca4-500d-4ec1-9971-c2943bca12eb	Electrical	\N	t	2026-03-11 22:48:31.789	2026-03-11 22:48:31.789
e96598b4-c34b-4571-b8e9-d74134b95a90	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	bcb28ca4-500d-4ec1-9971-c2943bca12eb	Plumbing	\N	t	2026-03-11 22:48:31.796	2026-03-11 22:48:31.796
b23858bd-c072-494b-987d-e5b2c14f355c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	bcb28ca4-500d-4ec1-9971-c2943bca12eb	HVAC	\N	t	2026-03-11 22:48:31.807	2026-03-11 22:48:31.807
704e1eff-1e9d-4fd2-b200-167b82d3bcd0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	bcb28ca4-500d-4ec1-9971-c2943bca12eb	General Maintenance	\N	t	2026-03-11 22:48:31.814	2026-03-11 22:48:31.814
a113fe00-22dc-4b3e-accd-f8dc95b979e5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	75cfe947-32bd-4562-9818-fec6fa0babe3	Stationery	\N	t	2026-03-11 22:48:31.837	2026-03-11 22:48:31.837
f5b1d51e-ae45-4758-8a9d-3ded0cc89bfc	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	75cfe947-32bd-4562-9818-fec6fa0babe3	Printing	\N	t	2026-03-11 22:48:31.845	2026-03-11 22:48:31.845
5dfa1a48-d5e8-4c47-a00d-24c752e36614	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	75cfe947-32bd-4562-9818-fec6fa0babe3	IT Accessories	\N	t	2026-03-11 22:48:31.854	2026-03-11 22:48:31.854
\.


--
-- TOC entry 4180 (class 0 OID 82961)
-- Dependencies: 249
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.subscriptions (id, "tenantId", "planType", status, "startDate", "endDate", "trialEndsAt", "maxUsers", "maxStores", "maxDepartments", "maxMonthlyMovements", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4182 (class 0 OID 82986)
-- Dependencies: 251
-- Data for Name: super_admin_logs; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.super_admin_logs (id, "adminUserId", action, "targetTenantId", details, "ipAddress", "createdAt") FROM stdin;
\.


--
-- TOC entry 4156 (class 0 OID 82178)
-- Dependencies: 225
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.suppliers (id, "tenantId", name, "contactPerson", phone, email, address, "isActive", "createdAt", "updatedAt") FROM stdin;
48652fbe-2a0f-4e0f-8fc1-739d9c19b8a8	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Emirates Linen Co.	Ahmad Khalid	\N	sales@emirateslinen.ae	\N	t	2026-03-11 22:48:31.862	2026-03-11 22:48:31.862
33fc30c3-1044-4b7b-8e11-c24cfdf64371	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Gulf Cleaning Supplies	Fatima Al-Ali	\N	orders@gulfcleaning.ae	\N	t	2026-03-11 22:48:31.876	2026-03-11 22:48:31.876
20b73456-dad4-4b67-9914-d2c72ade213f	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Hotel Amenities MENA	Carlos Rivera	\N	info@hamenities.com	\N	t	2026-03-11 22:48:31.883	2026-03-11 22:48:31.883
\.


--
-- TOC entry 4186 (class 0 OID 83113)
-- Dependencies: 255
-- Data for Name: tenant_settings; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.tenant_settings (id, "tenantId", key, value, "updatedBy", reason, "updatedAt") FROM stdin;
39cabf23-97d7-4845-b814-94d8f2093eaa	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	ob_import_enabled	false	\N	\N	2026-03-18 22:24:43.483
fa6ff928-c477-4921-89ea-b012779e57ac	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	allowOpeningBalance	LOCKED	\N	Auto-locked: COUNT_ADJUSTMENT posted via Stock Report (SRPT-2603-0006)	2026-03-19 16:26:13.25
\.


--
-- TOC entry 4181 (class 0 OID 82975)
-- Dependencies: 250
-- Data for Name: tenant_usage; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.tenant_usage (id, "tenantId", "totalUsers", "totalActiveStores", "movementsThisMonth", "movementsResetAt", "storageBytes", "lastActivityAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4147 (class 0 OID 82101)
-- Dependencies: 216
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.tenants (id, name, slug, "subscriptionTier", "logoUrl", address, phone, email, "isActive", "createdAt", "updatedAt", "licenseEndDate", "licenseStartDate", "maxUsers", "planType", "subStatus") FROM stdin;
56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Grand Horizon Hotel	grand-horizon	enterprise	\N	Sheikh Zayed Road, Dubai, UAE	+971-4-555-0100	admin@grandhorizon.com	t	2026-03-11 22:48:30.888	2026-03-11 22:48:30.888	\N	2026-03-11 22:48:30.888	10	BASIC	TRIAL
\.


--
-- TOC entry 4154 (class 0 OID 82162)
-- Dependencies: 223
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.units (id, "tenantId", name, abbreviation, "isActive", "createdAt") FROM stdin;
9a3364e3-f461-4968-8e81-f42973afea23	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Piece	PCS	t	2026-03-11 22:48:31.507
66f09ae4-651d-4acb-863b-281bd20ae5aa	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Carton	CTN	t	2026-03-11 22:48:31.519
64db2901-d87c-46d9-ab31-1128c9f551c5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Box	BOX	t	2026-03-11 22:48:31.527
f7167125-6d3c-4b60-9adf-c099af4f1da5	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Kilogram	KG	t	2026-03-11 22:48:31.537
fdd144f3-6156-4f50-8109-f1362a972f01	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Liter	LTR	t	2026-03-11 22:48:31.546
2d3cc66e-e79b-4ed5-bb09-c167eb950d53	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Dozen	DZN	t	2026-03-11 22:48:31.553
405e07c6-83c9-47dc-9c89-24ee93d9cd5a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Roll	ROL	t	2026-03-11 22:48:31.561
86cc2d2e-6eeb-4e9a-8a79-d8aacd4e9bc0	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Set	SET	t	2026-03-11 22:48:31.572
6636a59e-c70c-42a0-bdfb-96a112dd10b4	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Pack	PCK	t	2026-03-11 22:48:31.581
57d05932-17f9-412d-a491-f3d9da021b8c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	Bottle	BTL	t	2026-03-11 22:48:31.59
\.


--
-- TOC entry 4172 (class 0 OID 82607)
-- Dependencies: 241
-- Data for Name: uom_mappings; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.uom_mappings (id, "tenantId", "futurelogUom", "internalUomId", "conversionFactor", "createdBy", "updatedBy", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4148 (class 0 OID 82111)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.users (id, "tenantId", email, "passwordHash", "firstName", "lastName", role, department, phone, "isActive", "lastLoginAt", "createdAt", "updatedAt") FROM stdin;
e3ae711f-af6a-48ec-b101-1b8187d389af	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	store@grandhorizon.com	$2a$12$niu/FkIuRKWWPKivd97iVeFkCo22MtTEjfW58uw8oNNMr3RTNJuAK	Khalid	Hassan	STOREKEEPER	\N	\N	t	\N	2026-03-11 22:48:31.368	2026-03-11 22:48:31.368
9c6907b0-507f-4c75-946c-d3d0b7de93be	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	fb.manager@grandhorizon.com	$2a$12$niu/FkIuRKWWPKivd97iVeFkCo22MtTEjfW58uw8oNNMr3RTNJuAK	Layla	Mansour	DEPT_MANAGER	F&B	\N	t	\N	2026-03-11 22:48:31.379	2026-03-11 22:48:31.379
2c38163f-5ae1-4261-884e-2c73c4a5d79a	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	hk.manager@grandhorizon.com	$2a$12$niu/FkIuRKWWPKivd97iVeFkCo22MtTEjfW58uw8oNNMr3RTNJuAK	Omar	Al-Said	DEPT_MANAGER	Housekeeping	\N	t	\N	2026-03-11 22:48:31.391	2026-03-11 22:48:31.391
25fea4a3-1c3b-417b-8cec-f85ad4ed79ee	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	cost@grandhorizon.com	$2a$12$niu/FkIuRKWWPKivd97iVeFkCo22MtTEjfW58uw8oNNMr3RTNJuAK	Nadia	Ibrahim	COST_CONTROL	\N	\N	t	\N	2026-03-11 22:48:31.401	2026-03-11 22:48:31.401
4790cfe0-0c4a-46f8-b4ca-0510a8b8e458	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	finance@grandhorizon.com	$2a$12$niu/FkIuRKWWPKivd97iVeFkCo22MtTEjfW58uw8oNNMr3RTNJuAK	Youssef	Karimi	FINANCE_MANAGER	\N	\N	t	\N	2026-03-11 22:48:31.412	2026-03-11 22:48:31.412
ac73c91d-103d-4484-9f38-c35c3709c284	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	auditor@grandhorizon.com	$2a$12$niu/FkIuRKWWPKivd97iVeFkCo22MtTEjfW58uw8oNNMr3RTNJuAK	Hana	Al-Rashid	AUDITOR	\N	\N	t	\N	2026-03-11 22:48:31.424	2026-03-11 22:48:31.424
bd2b1285-43f8-4ae4-b1ee-6c54b82f6b3c	56e26c19-aff4-4fd9-8d43-a3ed4dde89d5	admin@admin.com	$2a$12$/syGP8ko1BKqrD5O0.SR/uF0XQpnm3ZoYt01pKiZMx7reifMDGvxe	Amr	Admin	ADMIN	\N	\N	t	2026-03-19 18:21:05.051	2026-03-11 22:48:31.345	2026-03-19 18:21:05.053
\.


--
-- TOC entry 4173 (class 0 OID 82618)
-- Dependencies: 242
-- Data for Name: vendor_mappings; Type: TABLE DATA; Schema: public; Owner: ose_user
--

COPY public.vendor_mappings (id, "tenantId", "futurelogVendorName", "internalSupplierId", "createdBy", "updatedBy", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3655 (class 2606 OID 81971)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 82244)
-- Name: approval_requests approval_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.approval_requests
    ADD CONSTRAINT approval_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 82252)
-- Name: approval_steps approval_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.approval_steps
    ADD CONSTRAINT approval_steps_pkey PRIMARY KEY (id);


--
-- TOC entry 3753 (class 2606 OID 82297)
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3669 (class 2606 OID 82137)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 83098)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3862 (class 2606 OID 84802)
-- Name: doc_sequence doc_sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.doc_sequence
    ADD CONSTRAINT doc_sequence_pkey PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 83168)
-- Name: generated_reports generated_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.generated_reports
    ADD CONSTRAINT generated_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3878 (class 2606 OID 89115)
-- Name: get_pass_lines get_pass_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_lines
    ADD CONSTRAINT get_pass_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3881 (class 2606 OID 89123)
-- Name: get_pass_returns get_pass_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_returns
    ADD CONSTRAINT get_pass_returns_pkey PRIMARY KEY (id);


--
-- TOC entry 3870 (class 2606 OID 89105)
-- Name: get_passes get_passes_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT get_passes_pkey PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 82585)
-- Name: grn_imports grn_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT grn_imports_pkey PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 82629)
-- Name: grn_imports grn_imports_tenantId_grnNumber_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_tenantId_grnNumber_key" UNIQUE ("tenantId", "grnNumber");


--
-- TOC entry 3767 (class 2606 OID 82596)
-- Name: grn_lines grn_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_lines
    ADD CONSTRAINT grn_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3739 (class 2606 OID 82273)
-- Name: import_rows import_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.import_rows
    ADD CONSTRAINT import_rows_pkey PRIMARY KEY (id);


--
-- TOC entry 3736 (class 2606 OID 82265)
-- Name: import_sessions import_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.import_sessions
    ADD CONSTRAINT import_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3705 (class 2606 OID 82209)
-- Name: inventory_ledger inventory_ledger_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.inventory_ledger
    ADD CONSTRAINT inventory_ledger_pkey PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 82606)
-- Name: item_mappings item_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.item_mappings
    ADD CONSTRAINT item_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 3771 (class 2606 OID 82631)
-- Name: item_mappings item_mappings_tenantId_futurelogItemCode_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.item_mappings
    ADD CONSTRAINT "item_mappings_tenantId_futurelogItemCode_key" UNIQUE ("tenantId", "futurelogItemCode");


--
-- TOC entry 3690 (class 2606 OID 82177)
-- Name: item_units item_units_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.item_units
    ADD CONSTRAINT item_units_pkey PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 82196)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 89096)
-- Name: items items_tenantId_code_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_tenantId_code_key" UNIQUE ("tenantId", code);


--
-- TOC entry 3865 (class 2606 OID 87988)
-- Name: location_categories location_categories_locationId_categoryId_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_categories
    ADD CONSTRAINT "location_categories_locationId_categoryId_key" UNIQUE ("locationId", "categoryId");


--
-- TOC entry 3867 (class 2606 OID 87986)
-- Name: location_categories location_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_categories
    ADD CONSTRAINT location_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3683 (class 2606 OID 82161)
-- Name: location_users location_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_users
    ADD CONSTRAINT location_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3678 (class 2606 OID 82156)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3720 (class 2606 OID 82227)
-- Name: movement_documents movement_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_documents
    ADD CONSTRAINT movement_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 3727 (class 2606 OID 82236)
-- Name: movement_lines movement_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_lines
    ADD CONSTRAINT movement_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 83107)
-- Name: period_closes period_closes_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.period_closes
    ADD CONSTRAINT period_closes_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 83112)
-- Name: period_snapshots period_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.period_snapshots
    ADD CONSTRAINT period_snapshots_pkey PRIMARY KEY (id);


--
-- TOC entry 3664 (class 2606 OID 82128)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 83153)
-- Name: saved_stock_report_lines saved_stock_report_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_report_lines
    ADD CONSTRAINT saved_stock_report_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3855 (class 2606 OID 83160)
-- Name: saved_stock_report_location_qtys saved_stock_report_location_qtys_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_report_location_qtys
    ADD CONSTRAINT saved_stock_report_location_qtys_pkey PRIMARY KEY (id);


--
-- TOC entry 3844 (class 2606 OID 83140)
-- Name: saved_stock_reports saved_stock_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_reports
    ADD CONSTRAINT saved_stock_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3715 (class 2606 OID 82217)
-- Name: stock_balances stock_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_balances
    ADD CONSTRAINT stock_balances_pkey PRIMARY KEY ("tenantId", "itemId", "locationId");


--
-- TOC entry 3749 (class 2606 OID 82289)
-- Name: stock_count_lines stock_count_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_lines
    ADD CONSTRAINT stock_count_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3743 (class 2606 OID 82282)
-- Name: stock_count_sessions stock_count_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_sessions
    ADD CONSTRAINT stock_count_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3801 (class 2606 OID 82822)
-- Name: store_issue_lines store_issue_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issue_lines
    ADD CONSTRAINT store_issue_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 82795)
-- Name: store_issues store_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issues
    ADD CONSTRAINT store_issues_pkey PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 82797)
-- Name: store_issues store_issues_tenantId_issueNo_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issues
    ADD CONSTRAINT "store_issues_tenantId_issueNo_key" UNIQUE ("tenantId", "issueNo");


--
-- TOC entry 3791 (class 2606 OID 82767)
-- Name: store_requisition_lines store_requisition_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisition_lines
    ADD CONSTRAINT store_requisition_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3784 (class 2606 OID 82728)
-- Name: store_requisitions store_requisitions_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT store_requisitions_pkey PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 82730)
-- Name: store_requisitions store_requisitions_tenantId_requisitionNo_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT "store_requisitions_tenantId_requisitionNo_key" UNIQUE ("tenantId", "requisitionNo");


--
-- TOC entry 3812 (class 2606 OID 82923)
-- Name: store_transfer_lines store_transfer_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfer_lines
    ADD CONSTRAINT store_transfer_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 3804 (class 2606 OID 82872)
-- Name: store_transfers store_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT store_transfers_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 82874)
-- Name: store_transfers store_transfers_tenantId_transferNo_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_tenantId_transferNo_key" UNIQUE ("tenantId", "transferNo");


--
-- TOC entry 3673 (class 2606 OID 82146)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- TOC entry 3815 (class 2606 OID 82974)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 82994)
-- Name: super_admin_logs super_admin_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.super_admin_logs
    ADD CONSTRAINT super_admin_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3693 (class 2606 OID 82186)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 83119)
-- Name: tenant_settings tenant_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.tenant_settings
    ADD CONSTRAINT tenant_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 82985)
-- Name: tenant_usage tenant_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.tenant_usage
    ADD CONSTRAINT tenant_usage_pkey PRIMARY KEY (id);


--
-- TOC entry 3657 (class 2606 OID 82110)
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 82170)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 3774 (class 2606 OID 82617)
-- Name: uom_mappings uom_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.uom_mappings
    ADD CONSTRAINT uom_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 82633)
-- Name: uom_mappings uom_mappings_tenantId_futurelogUom_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.uom_mappings
    ADD CONSTRAINT "uom_mappings_tenantId_futurelogUom_key" UNIQUE ("tenantId", "futurelogUom");


--
-- TOC entry 3660 (class 2606 OID 82120)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3779 (class 2606 OID 82627)
-- Name: vendor_mappings vendor_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.vendor_mappings
    ADD CONSTRAINT vendor_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 82635)
-- Name: vendor_mappings vendor_mappings_tenantId_futurelogVendorName_key; Type: CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.vendor_mappings
    ADD CONSTRAINT "vendor_mappings_tenantId_futurelogVendorName_key" UNIQUE ("tenantId", "futurelogVendorName");


--
-- TOC entry 3728 (class 1259 OID 82328)
-- Name: approval_requests_documentId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "approval_requests_documentId_key" ON public.approval_requests USING btree ("documentId");


--
-- TOC entry 3731 (class 1259 OID 82329)
-- Name: approval_requests_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "approval_requests_tenantId_status_idx" ON public.approval_requests USING btree ("tenantId", status);


--
-- TOC entry 3734 (class 1259 OID 82330)
-- Name: approval_steps_requestId_stepNumber_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "approval_steps_requestId_stepNumber_key" ON public.approval_steps USING btree ("requestId", "stepNumber");


--
-- TOC entry 3754 (class 1259 OID 82338)
-- Name: audit_log_tenantId_changedAt_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "audit_log_tenantId_changedAt_idx" ON public.audit_log USING btree ("tenantId", "changedAt");


--
-- TOC entry 3755 (class 1259 OID 82339)
-- Name: audit_log_tenantId_changedBy_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "audit_log_tenantId_changedBy_idx" ON public.audit_log USING btree ("tenantId", "changedBy");


--
-- TOC entry 3756 (class 1259 OID 82337)
-- Name: audit_log_tenantId_entityType_entityId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "audit_log_tenantId_entityType_entityId_idx" ON public.audit_log USING btree ("tenantId", "entityType", "entityId");


--
-- TOC entry 3667 (class 1259 OID 87999)
-- Name: categories_departmentId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "categories_departmentId_idx" ON public.categories USING btree ("departmentId");


--
-- TOC entry 3670 (class 1259 OID 82303)
-- Name: categories_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "categories_tenantId_idx" ON public.categories USING btree ("tenantId");


--
-- TOC entry 3671 (class 1259 OID 82304)
-- Name: categories_tenantId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "categories_tenantId_name_key" ON public.categories USING btree ("tenantId", name);


--
-- TOC entry 3827 (class 1259 OID 83171)
-- Name: departments_tenantId_code_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "departments_tenantId_code_key" ON public.departments USING btree ("tenantId", code);


--
-- TOC entry 3828 (class 1259 OID 83169)
-- Name: departments_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "departments_tenantId_idx" ON public.departments USING btree ("tenantId");


--
-- TOC entry 3829 (class 1259 OID 83170)
-- Name: departments_tenantId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "departments_tenantId_name_key" ON public.departments USING btree ("tenantId", name);


--
-- TOC entry 3863 (class 1259 OID 84803)
-- Name: doc_sequence_tenantId_prefix_year_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "doc_sequence_tenantId_prefix_year_key" ON public.doc_sequence USING btree ("tenantId", prefix, year);


--
-- TOC entry 3858 (class 1259 OID 83193)
-- Name: generated_reports_tenantId_departmentId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "generated_reports_tenantId_departmentId_idx" ON public.generated_reports USING btree ("tenantId", "departmentId");


--
-- TOC entry 3859 (class 1259 OID 83191)
-- Name: generated_reports_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "generated_reports_tenantId_idx" ON public.generated_reports USING btree ("tenantId");


--
-- TOC entry 3860 (class 1259 OID 83192)
-- Name: generated_reports_tenantId_reportType_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "generated_reports_tenantId_reportType_idx" ON public.generated_reports USING btree ("tenantId", "reportType");


--
-- TOC entry 3874 (class 1259 OID 89128)
-- Name: get_pass_lines_getPassId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_pass_lines_getPassId_idx" ON public.get_pass_lines USING btree ("getPassId");


--
-- TOC entry 3875 (class 1259 OID 89129)
-- Name: get_pass_lines_itemId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_pass_lines_itemId_idx" ON public.get_pass_lines USING btree ("itemId");


--
-- TOC entry 3876 (class 1259 OID 89130)
-- Name: get_pass_lines_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_pass_lines_locationId_idx" ON public.get_pass_lines USING btree ("locationId");


--
-- TOC entry 3879 (class 1259 OID 89131)
-- Name: get_pass_returns_getPassLineId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_pass_returns_getPassLineId_idx" ON public.get_pass_returns USING btree ("getPassLineId");


--
-- TOC entry 3882 (class 1259 OID 89132)
-- Name: get_pass_returns_returnDate_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_pass_returns_returnDate_idx" ON public.get_pass_returns USING btree ("returnDate");


--
-- TOC entry 3868 (class 1259 OID 89126)
-- Name: get_passes_departmentId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_passes_departmentId_idx" ON public.get_passes USING btree ("departmentId");


--
-- TOC entry 3871 (class 1259 OID 89124)
-- Name: get_passes_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_passes_tenantId_idx" ON public.get_passes USING btree ("tenantId");


--
-- TOC entry 3872 (class 1259 OID 89127)
-- Name: get_passes_tenantId_passNo_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "get_passes_tenantId_passNo_key" ON public.get_passes USING btree ("tenantId", "passNo");


--
-- TOC entry 3873 (class 1259 OID 89125)
-- Name: get_passes_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "get_passes_tenantId_status_idx" ON public.get_passes USING btree ("tenantId", status);


--
-- TOC entry 3761 (class 1259 OID 82638)
-- Name: grn_imports_tenantId_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "grn_imports_tenantId_locationId_idx" ON public.grn_imports USING btree ("tenantId", "locationId");


--
-- TOC entry 3762 (class 1259 OID 82636)
-- Name: grn_imports_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "grn_imports_tenantId_status_idx" ON public.grn_imports USING btree ("tenantId", status);


--
-- TOC entry 3763 (class 1259 OID 82637)
-- Name: grn_imports_tenantId_vendorId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "grn_imports_tenantId_vendorId_idx" ON public.grn_imports USING btree ("tenantId", "vendorId");


--
-- TOC entry 3764 (class 1259 OID 82639)
-- Name: grn_lines_grnImportId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "grn_lines_grnImportId_idx" ON public.grn_lines USING btree ("grnImportId");


--
-- TOC entry 3765 (class 1259 OID 82640)
-- Name: grn_lines_grnImportId_isMapped_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "grn_lines_grnImportId_isMapped_idx" ON public.grn_lines USING btree ("grnImportId", "isMapped");


--
-- TOC entry 3740 (class 1259 OID 82332)
-- Name: import_rows_sessionId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "import_rows_sessionId_idx" ON public.import_rows USING btree ("sessionId");


--
-- TOC entry 3737 (class 1259 OID 82331)
-- Name: import_sessions_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "import_sessions_tenantId_idx" ON public.import_sessions USING btree ("tenantId");


--
-- TOC entry 3706 (class 1259 OID 82321)
-- Name: inventory_ledger_tenantId_createdAt_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_createdAt_idx" ON public.inventory_ledger USING btree ("tenantId", "createdAt");


--
-- TOC entry 3707 (class 1259 OID 82319)
-- Name: inventory_ledger_tenantId_itemId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_itemId_idx" ON public.inventory_ledger USING btree ("tenantId", "itemId");


--
-- TOC entry 3708 (class 1259 OID 82320)
-- Name: inventory_ledger_tenantId_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_locationId_idx" ON public.inventory_ledger USING btree ("tenantId", "locationId");


--
-- TOC entry 3709 (class 1259 OID 82557)
-- Name: inventory_ledger_tenantId_locationId_itemId_createdAt_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_locationId_itemId_createdAt_idx" ON public.inventory_ledger USING btree ("tenantId", "locationId", "itemId", "createdAt");


--
-- TOC entry 3710 (class 1259 OID 83195)
-- Name: inventory_ledger_tenantId_locationId_itemId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_locationId_itemId_idx" ON public.inventory_ledger USING btree ("tenantId", "locationId", "itemId");


--
-- TOC entry 3711 (class 1259 OID 83194)
-- Name: inventory_ledger_tenantId_movementType_createdAt_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_movementType_createdAt_idx" ON public.inventory_ledger USING btree ("tenantId", "movementType", "createdAt");


--
-- TOC entry 3712 (class 1259 OID 82322)
-- Name: inventory_ledger_tenantId_movementType_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_movementType_idx" ON public.inventory_ledger USING btree ("tenantId", "movementType");


--
-- TOC entry 3713 (class 1259 OID 82558)
-- Name: inventory_ledger_tenantId_referenceId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "inventory_ledger_tenantId_referenceId_idx" ON public.inventory_ledger USING btree ("tenantId", "referenceId");


--
-- TOC entry 3772 (class 1259 OID 82641)
-- Name: item_mappings_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "item_mappings_tenantId_idx" ON public.item_mappings USING btree ("tenantId");


--
-- TOC entry 3688 (class 1259 OID 82313)
-- Name: item_units_itemId_unitType_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "item_units_itemId_unitType_key" ON public.item_units USING btree ("itemId", "unitType");


--
-- TOC entry 3691 (class 1259 OID 82312)
-- Name: item_units_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "item_units_tenantId_idx" ON public.item_units USING btree ("tenantId");


--
-- TOC entry 3698 (class 1259 OID 82317)
-- Name: items_tenantId_categoryId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "items_tenantId_categoryId_idx" ON public.items USING btree ("tenantId", "categoryId");


--
-- TOC entry 3701 (class 1259 OID 83196)
-- Name: items_tenantId_departmentId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "items_tenantId_departmentId_idx" ON public.items USING btree ("tenantId", "departmentId");


--
-- TOC entry 3702 (class 1259 OID 82316)
-- Name: items_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "items_tenantId_idx" ON public.items USING btree ("tenantId");


--
-- TOC entry 3703 (class 1259 OID 82318)
-- Name: items_tenantId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "items_tenantId_name_key" ON public.items USING btree ("tenantId", name);


--
-- TOC entry 3681 (class 1259 OID 82309)
-- Name: location_users_locationId_userId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "location_users_locationId_userId_key" ON public.location_users USING btree ("locationId", "userId");


--
-- TOC entry 3676 (class 1259 OID 83197)
-- Name: locations_departmentId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "locations_departmentId_idx" ON public.locations USING btree ("departmentId");


--
-- TOC entry 3679 (class 1259 OID 82307)
-- Name: locations_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "locations_tenantId_idx" ON public.locations USING btree ("tenantId");


--
-- TOC entry 3680 (class 1259 OID 82308)
-- Name: locations_tenantId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "locations_tenantId_name_key" ON public.locations USING btree ("tenantId", name);


--
-- TOC entry 3721 (class 1259 OID 82326)
-- Name: movement_documents_tenantId_documentNo_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "movement_documents_tenantId_documentNo_key" ON public.movement_documents USING btree ("tenantId", "documentNo");


--
-- TOC entry 3722 (class 1259 OID 83198)
-- Name: movement_documents_tenantId_movementType_documentDate_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "movement_documents_tenantId_movementType_documentDate_idx" ON public.movement_documents USING btree ("tenantId", "movementType", "documentDate");


--
-- TOC entry 3723 (class 1259 OID 82324)
-- Name: movement_documents_tenantId_movementType_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "movement_documents_tenantId_movementType_idx" ON public.movement_documents USING btree ("tenantId", "movementType");


--
-- TOC entry 3724 (class 1259 OID 82325)
-- Name: movement_documents_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "movement_documents_tenantId_status_idx" ON public.movement_documents USING btree ("tenantId", status);


--
-- TOC entry 3725 (class 1259 OID 82327)
-- Name: movement_lines_documentId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "movement_lines_documentId_idx" ON public.movement_lines USING btree ("documentId");


--
-- TOC entry 3832 (class 1259 OID 83172)
-- Name: period_closes_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "period_closes_tenantId_idx" ON public.period_closes USING btree ("tenantId");


--
-- TOC entry 3833 (class 1259 OID 83173)
-- Name: period_closes_tenantId_year_month_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "period_closes_tenantId_year_month_key" ON public.period_closes USING btree ("tenantId", year, month);


--
-- TOC entry 3834 (class 1259 OID 83174)
-- Name: period_snapshots_periodCloseId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "period_snapshots_periodCloseId_idx" ON public.period_snapshots USING btree ("periodCloseId");


--
-- TOC entry 3835 (class 1259 OID 83175)
-- Name: period_snapshots_periodCloseId_itemId_locationId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "period_snapshots_periodCloseId_itemId_locationId_key" ON public.period_snapshots USING btree ("periodCloseId", "itemId", "locationId");


--
-- TOC entry 3665 (class 1259 OID 82301)
-- Name: refresh_tokens_token_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX refresh_tokens_token_key ON public.refresh_tokens USING btree (token);


--
-- TOC entry 3666 (class 1259 OID 82302)
-- Name: refresh_tokens_userId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "refresh_tokens_userId_idx" ON public.refresh_tokens USING btree ("userId");


--
-- TOC entry 3851 (class 1259 OID 83188)
-- Name: saved_stock_report_lines_reportId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "saved_stock_report_lines_reportId_idx" ON public.saved_stock_report_lines USING btree ("reportId");


--
-- TOC entry 3852 (class 1259 OID 83189)
-- Name: saved_stock_report_location_qtys_lineId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "saved_stock_report_location_qtys_lineId_idx" ON public.saved_stock_report_location_qtys USING btree ("lineId");


--
-- TOC entry 3853 (class 1259 OID 83190)
-- Name: saved_stock_report_location_qtys_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "saved_stock_report_location_qtys_locationId_idx" ON public.saved_stock_report_location_qtys USING btree ("locationId");


--
-- TOC entry 3842 (class 1259 OID 83183)
-- Name: saved_stock_reports_approvalRequestId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "saved_stock_reports_approvalRequestId_key" ON public.saved_stock_reports USING btree ("approvalRequestId");


--
-- TOC entry 3845 (class 1259 OID 83184)
-- Name: saved_stock_reports_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "saved_stock_reports_tenantId_idx" ON public.saved_stock_reports USING btree ("tenantId");


--
-- TOC entry 3846 (class 1259 OID 83186)
-- Name: saved_stock_reports_tenantId_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "saved_stock_reports_tenantId_locationId_idx" ON public.saved_stock_reports USING btree ("tenantId", "locationId");


--
-- TOC entry 3847 (class 1259 OID 83187)
-- Name: saved_stock_reports_tenantId_reportNo_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "saved_stock_reports_tenantId_reportNo_key" ON public.saved_stock_reports USING btree ("tenantId", "reportNo");


--
-- TOC entry 3848 (class 1259 OID 83185)
-- Name: saved_stock_reports_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "saved_stock_reports_tenantId_status_idx" ON public.saved_stock_reports USING btree ("tenantId", status);


--
-- TOC entry 3716 (class 1259 OID 82323)
-- Name: stock_balances_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "stock_balances_tenantId_idx" ON public.stock_balances USING btree ("tenantId");


--
-- TOC entry 3717 (class 1259 OID 83200)
-- Name: stock_balances_tenantId_itemId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "stock_balances_tenantId_itemId_idx" ON public.stock_balances USING btree ("tenantId", "itemId");


--
-- TOC entry 3718 (class 1259 OID 83199)
-- Name: stock_balances_tenantId_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "stock_balances_tenantId_locationId_idx" ON public.stock_balances USING btree ("tenantId", "locationId");


--
-- TOC entry 3750 (class 1259 OID 82335)
-- Name: stock_count_lines_sessionId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "stock_count_lines_sessionId_idx" ON public.stock_count_lines USING btree ("sessionId");


--
-- TOC entry 3751 (class 1259 OID 82336)
-- Name: stock_count_lines_sessionId_itemId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "stock_count_lines_sessionId_itemId_key" ON public.stock_count_lines USING btree ("sessionId", "itemId");


--
-- TOC entry 3741 (class 1259 OID 83201)
-- Name: stock_count_sessions_approvalRequestId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "stock_count_sessions_approvalRequestId_key" ON public.stock_count_sessions USING btree ("approvalRequestId");


--
-- TOC entry 3744 (class 1259 OID 83202)
-- Name: stock_count_sessions_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX stock_count_sessions_status_idx ON public.stock_count_sessions USING btree (status);


--
-- TOC entry 3745 (class 1259 OID 82333)
-- Name: stock_count_sessions_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "stock_count_sessions_tenantId_idx" ON public.stock_count_sessions USING btree ("tenantId");


--
-- TOC entry 3746 (class 1259 OID 82334)
-- Name: stock_count_sessions_tenantId_sessionNo_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "stock_count_sessions_tenantId_sessionNo_key" ON public.stock_count_sessions USING btree ("tenantId", "sessionNo");


--
-- TOC entry 3747 (class 1259 OID 83203)
-- Name: stock_count_sessions_tenantId_status_snapshotAt_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "stock_count_sessions_tenantId_status_snapshotAt_idx" ON public.stock_count_sessions USING btree ("tenantId", status, "snapshotAt");


--
-- TOC entry 3799 (class 1259 OID 82843)
-- Name: store_issue_lines_issueId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_issue_lines_issueId_idx" ON public.store_issue_lines USING btree ("issueId");


--
-- TOC entry 3802 (class 1259 OID 82844)
-- Name: store_issue_lines_requisitionLineId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_issue_lines_requisitionLineId_idx" ON public.store_issue_lines USING btree ("requisitionLineId");


--
-- TOC entry 3795 (class 1259 OID 82813)
-- Name: store_issues_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_issues_tenantId_idx" ON public.store_issues USING btree ("tenantId");


--
-- TOC entry 3798 (class 1259 OID 82814)
-- Name: store_issues_tenantId_requisitionId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_issues_tenantId_requisitionId_idx" ON public.store_issues USING btree ("tenantId", "requisitionId");


--
-- TOC entry 3792 (class 1259 OID 82783)
-- Name: store_requisition_lines_requisitionId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_requisition_lines_requisitionId_idx" ON public.store_requisition_lines USING btree ("requisitionId");


--
-- TOC entry 3785 (class 1259 OID 82756)
-- Name: store_requisitions_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_requisitions_tenantId_idx" ON public.store_requisitions USING btree ("tenantId");


--
-- TOC entry 3786 (class 1259 OID 82758)
-- Name: store_requisitions_tenantId_locationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_requisitions_tenantId_locationId_idx" ON public.store_requisitions USING btree ("tenantId", "locationId");


--
-- TOC entry 3789 (class 1259 OID 82757)
-- Name: store_requisitions_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_requisitions_tenantId_status_idx" ON public.store_requisitions USING btree ("tenantId", status);


--
-- TOC entry 3813 (class 1259 OID 82939)
-- Name: store_transfer_lines_transferId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_transfer_lines_transferId_idx" ON public.store_transfer_lines USING btree ("transferId");


--
-- TOC entry 3805 (class 1259 OID 82913)
-- Name: store_transfers_tenantId_destLocationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_transfers_tenantId_destLocationId_idx" ON public.store_transfers USING btree ("tenantId", "destLocationId");


--
-- TOC entry 3806 (class 1259 OID 82910)
-- Name: store_transfers_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_transfers_tenantId_idx" ON public.store_transfers USING btree ("tenantId");


--
-- TOC entry 3807 (class 1259 OID 82912)
-- Name: store_transfers_tenantId_sourceLocationId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_transfers_tenantId_sourceLocationId_idx" ON public.store_transfers USING btree ("tenantId", "sourceLocationId");


--
-- TOC entry 3808 (class 1259 OID 82911)
-- Name: store_transfers_tenantId_status_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "store_transfers_tenantId_status_idx" ON public.store_transfers USING btree ("tenantId", status);


--
-- TOC entry 3674 (class 1259 OID 82306)
-- Name: subcategories_tenantId_categoryId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "subcategories_tenantId_categoryId_name_key" ON public.subcategories USING btree ("tenantId", "categoryId", name);


--
-- TOC entry 3675 (class 1259 OID 82305)
-- Name: subcategories_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "subcategories_tenantId_idx" ON public.subcategories USING btree ("tenantId");


--
-- TOC entry 3816 (class 1259 OID 82995)
-- Name: subscriptions_tenantId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "subscriptions_tenantId_key" ON public.subscriptions USING btree ("tenantId");


--
-- TOC entry 3820 (class 1259 OID 82997)
-- Name: super_admin_logs_adminUserId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "super_admin_logs_adminUserId_idx" ON public.super_admin_logs USING btree ("adminUserId");


--
-- TOC entry 3821 (class 1259 OID 82999)
-- Name: super_admin_logs_createdAt_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "super_admin_logs_createdAt_idx" ON public.super_admin_logs USING btree ("createdAt");


--
-- TOC entry 3824 (class 1259 OID 82998)
-- Name: super_admin_logs_targetTenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "super_admin_logs_targetTenantId_idx" ON public.super_admin_logs USING btree ("targetTenantId");


--
-- TOC entry 3694 (class 1259 OID 82314)
-- Name: suppliers_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "suppliers_tenantId_idx" ON public.suppliers USING btree ("tenantId");


--
-- TOC entry 3695 (class 1259 OID 82315)
-- Name: suppliers_tenantId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "suppliers_tenantId_name_key" ON public.suppliers USING btree ("tenantId", name);


--
-- TOC entry 3840 (class 1259 OID 83176)
-- Name: tenant_settings_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "tenant_settings_tenantId_idx" ON public.tenant_settings USING btree ("tenantId");


--
-- TOC entry 3841 (class 1259 OID 83177)
-- Name: tenant_settings_tenantId_key_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "tenant_settings_tenantId_key_key" ON public.tenant_settings USING btree ("tenantId", key);


--
-- TOC entry 3819 (class 1259 OID 82996)
-- Name: tenant_usage_tenantId_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "tenant_usage_tenantId_key" ON public.tenant_usage USING btree ("tenantId");


--
-- TOC entry 3658 (class 1259 OID 82298)
-- Name: tenants_slug_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX tenants_slug_key ON public.tenants USING btree (slug);


--
-- TOC entry 3686 (class 1259 OID 82310)
-- Name: units_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "units_tenantId_idx" ON public.units USING btree ("tenantId");


--
-- TOC entry 3687 (class 1259 OID 82311)
-- Name: units_tenantId_name_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "units_tenantId_name_key" ON public.units USING btree ("tenantId", name);


--
-- TOC entry 3777 (class 1259 OID 82642)
-- Name: uom_mappings_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "uom_mappings_tenantId_idx" ON public.uom_mappings USING btree ("tenantId");


--
-- TOC entry 3661 (class 1259 OID 82300)
-- Name: users_tenantId_email_key; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE UNIQUE INDEX "users_tenantId_email_key" ON public.users USING btree ("tenantId", email);


--
-- TOC entry 3662 (class 1259 OID 82299)
-- Name: users_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "users_tenantId_idx" ON public.users USING btree ("tenantId");


--
-- TOC entry 3782 (class 1259 OID 82643)
-- Name: vendor_mappings_tenantId_idx; Type: INDEX; Schema: public; Owner: ose_user
--

CREATE INDEX "vendor_mappings_tenantId_idx" ON public.vendor_mappings USING btree ("tenantId");


--
-- TOC entry 3916 (class 2606 OID 82490)
-- Name: approval_requests approval_requests_documentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.approval_requests
    ADD CONSTRAINT "approval_requests_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES public.movement_documents(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3917 (class 2606 OID 82485)
-- Name: approval_requests approval_requests_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.approval_requests
    ADD CONSTRAINT "approval_requests_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3918 (class 2606 OID 82500)
-- Name: approval_steps approval_steps_actedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.approval_steps
    ADD CONSTRAINT "approval_steps_actedBy_fkey" FOREIGN KEY ("actedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3919 (class 2606 OID 82495)
-- Name: approval_steps approval_steps_requestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.approval_steps
    ADD CONSTRAINT "approval_steps_requestId_fkey" FOREIGN KEY ("requestId") REFERENCES public.approval_requests(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3930 (class 2606 OID 82550)
-- Name: audit_log audit_log_changedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT "audit_log_changedBy_fkey" FOREIGN KEY ("changedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3931 (class 2606 OID 82545)
-- Name: audit_log audit_log_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT "audit_log_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3885 (class 2606 OID 89133)
-- Name: categories categories_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "categories_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3886 (class 2606 OID 82350)
-- Name: categories categories_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "categories_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3971 (class 2606 OID 83209)
-- Name: departments departments_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT "departments_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3986 (class 2606 OID 84804)
-- Name: doc_sequence doc_sequence_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.doc_sequence
    ADD CONSTRAINT "doc_sequence_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3983 (class 2606 OID 83449)
-- Name: generated_reports generated_reports_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.generated_reports
    ADD CONSTRAINT "generated_reports_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3984 (class 2606 OID 83454)
-- Name: generated_reports generated_reports_generatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.generated_reports
    ADD CONSTRAINT "generated_reports_generatedBy_fkey" FOREIGN KEY ("generatedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3985 (class 2606 OID 83444)
-- Name: generated_reports generated_reports_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.generated_reports
    ADD CONSTRAINT "generated_reports_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3997 (class 2606 OID 89178)
-- Name: get_pass_lines get_pass_lines_getPassId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_lines
    ADD CONSTRAINT "get_pass_lines_getPassId_fkey" FOREIGN KEY ("getPassId") REFERENCES public.get_passes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3998 (class 2606 OID 89183)
-- Name: get_pass_lines get_pass_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_lines
    ADD CONSTRAINT "get_pass_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3999 (class 2606 OID 89188)
-- Name: get_pass_lines get_pass_lines_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_lines
    ADD CONSTRAINT "get_pass_lines_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4000 (class 2606 OID 89193)
-- Name: get_pass_returns get_pass_returns_getPassLineId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_returns
    ADD CONSTRAINT "get_pass_returns_getPassLineId_fkey" FOREIGN KEY ("getPassLineId") REFERENCES public.get_pass_lines(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4001 (class 2606 OID 89198)
-- Name: get_pass_returns get_pass_returns_registeredBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_returns
    ADD CONSTRAINT "get_pass_returns_registeredBy_fkey" FOREIGN KEY ("registeredBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4002 (class 2606 OID 89203)
-- Name: get_pass_returns get_pass_returns_securityVerifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_pass_returns
    ADD CONSTRAINT "get_pass_returns_securityVerifiedBy_fkey" FOREIGN KEY ("securityVerifiedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3989 (class 2606 OID 89168)
-- Name: get_passes get_passes_checkedOutBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_checkedOutBy_fkey" FOREIGN KEY ("checkedOutBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3990 (class 2606 OID 89173)
-- Name: get_passes get_passes_closedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_closedBy_fkey" FOREIGN KEY ("closedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3991 (class 2606 OID 89148)
-- Name: get_passes get_passes_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3992 (class 2606 OID 89143)
-- Name: get_passes get_passes_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3993 (class 2606 OID 89153)
-- Name: get_passes get_passes_deptApprovedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_deptApprovedBy_fkey" FOREIGN KEY ("deptApprovedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3994 (class 2606 OID 89158)
-- Name: get_passes get_passes_financeApprovedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_financeApprovedBy_fkey" FOREIGN KEY ("financeApprovedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3995 (class 2606 OID 89163)
-- Name: get_passes get_passes_securityApprovedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_securityApprovedBy_fkey" FOREIGN KEY ("securityApprovedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3996 (class 2606 OID 89138)
-- Name: get_passes get_passes_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.get_passes
    ADD CONSTRAINT "get_passes_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3932 (class 2606 OID 82664)
-- Name: grn_imports grn_imports_approvedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_approvedBy_fkey" FOREIGN KEY ("approvedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3933 (class 2606 OID 82659)
-- Name: grn_imports grn_imports_importedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_importedBy_fkey" FOREIGN KEY ("importedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3934 (class 2606 OID 82654)
-- Name: grn_imports grn_imports_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3935 (class 2606 OID 82669)
-- Name: grn_imports grn_imports_rejectedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_rejectedBy_fkey" FOREIGN KEY ("rejectedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3936 (class 2606 OID 82644)
-- Name: grn_imports grn_imports_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3937 (class 2606 OID 82649)
-- Name: grn_imports grn_imports_vendorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_imports
    ADD CONSTRAINT "grn_imports_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES public.suppliers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3938 (class 2606 OID 82674)
-- Name: grn_lines grn_lines_grnImportId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.grn_lines
    ADD CONSTRAINT "grn_lines_grnImportId_fkey" FOREIGN KEY ("grnImportId") REFERENCES public.grn_imports(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3922 (class 2606 OID 82515)
-- Name: import_rows import_rows_sessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.import_rows
    ADD CONSTRAINT "import_rows_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES public.import_sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3920 (class 2606 OID 82510)
-- Name: import_sessions import_sessions_importedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.import_sessions
    ADD CONSTRAINT "import_sessions_importedBy_fkey" FOREIGN KEY ("importedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3921 (class 2606 OID 82505)
-- Name: import_sessions import_sessions_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.import_sessions
    ADD CONSTRAINT "import_sessions_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3903 (class 2606 OID 82440)
-- Name: inventory_ledger inventory_ledger_approvalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.inventory_ledger
    ADD CONSTRAINT "inventory_ledger_approvalId_fkey" FOREIGN KEY ("approvalId") REFERENCES public.approval_requests(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3904 (class 2606 OID 82435)
-- Name: inventory_ledger inventory_ledger_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.inventory_ledger
    ADD CONSTRAINT "inventory_ledger_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3905 (class 2606 OID 82425)
-- Name: inventory_ledger inventory_ledger_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.inventory_ledger
    ADD CONSTRAINT "inventory_ledger_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3906 (class 2606 OID 82430)
-- Name: inventory_ledger inventory_ledger_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.inventory_ledger
    ADD CONSTRAINT "inventory_ledger_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3907 (class 2606 OID 82420)
-- Name: inventory_ledger inventory_ledger_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.inventory_ledger
    ADD CONSTRAINT "inventory_ledger_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3939 (class 2606 OID 82679)
-- Name: item_mappings item_mappings_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.item_mappings
    ADD CONSTRAINT "item_mappings_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3894 (class 2606 OID 82385)
-- Name: item_units item_units_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.item_units
    ADD CONSTRAINT "item_units_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3895 (class 2606 OID 82390)
-- Name: item_units item_units_unitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.item_units
    ADD CONSTRAINT "item_units_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3897 (class 2606 OID 82405)
-- Name: items items_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3898 (class 2606 OID 83224)
-- Name: items items_defaultStoreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_defaultStoreId_fkey" FOREIGN KEY ("defaultStoreId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3899 (class 2606 OID 83219)
-- Name: items items_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3900 (class 2606 OID 82410)
-- Name: items items_subcategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES public.subcategories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3901 (class 2606 OID 82415)
-- Name: items items_supplierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES public.suppliers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3902 (class 2606 OID 82400)
-- Name: items items_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3987 (class 2606 OID 87994)
-- Name: location_categories location_categories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_categories
    ADD CONSTRAINT "location_categories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3988 (class 2606 OID 87989)
-- Name: location_categories location_categories_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_categories
    ADD CONSTRAINT "location_categories_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 82370)
-- Name: location_users location_users_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_users
    ADD CONSTRAINT "location_users_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3892 (class 2606 OID 82375)
-- Name: location_users location_users_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.location_users
    ADD CONSTRAINT "location_users_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3889 (class 2606 OID 83214)
-- Name: locations locations_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "locations_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3890 (class 2606 OID 82365)
-- Name: locations locations_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "locations_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3911 (class 2606 OID 82465)
-- Name: movement_documents movement_documents_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_documents
    ADD CONSTRAINT "movement_documents_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3912 (class 2606 OID 82460)
-- Name: movement_documents movement_documents_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_documents
    ADD CONSTRAINT "movement_documents_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3913 (class 2606 OID 82470)
-- Name: movement_lines movement_lines_documentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_lines
    ADD CONSTRAINT "movement_lines_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES public.movement_documents(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3914 (class 2606 OID 82475)
-- Name: movement_lines movement_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_lines
    ADD CONSTRAINT "movement_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3915 (class 2606 OID 82480)
-- Name: movement_lines movement_lines_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.movement_lines
    ADD CONSTRAINT "movement_lines_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3972 (class 2606 OID 83239)
-- Name: period_closes period_closes_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.period_closes
    ADD CONSTRAINT "period_closes_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3973 (class 2606 OID 83244)
-- Name: period_snapshots period_snapshots_periodCloseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.period_snapshots
    ADD CONSTRAINT "period_snapshots_periodCloseId_fkey" FOREIGN KEY ("periodCloseId") REFERENCES public.period_closes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 82345)
-- Name: refresh_tokens refresh_tokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT "refresh_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3979 (class 2606 OID 83429)
-- Name: saved_stock_report_lines saved_stock_report_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_report_lines
    ADD CONSTRAINT "saved_stock_report_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3980 (class 2606 OID 83424)
-- Name: saved_stock_report_lines saved_stock_report_lines_reportId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_report_lines
    ADD CONSTRAINT "saved_stock_report_lines_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES public.saved_stock_reports(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3981 (class 2606 OID 83434)
-- Name: saved_stock_report_location_qtys saved_stock_report_location_qtys_lineId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_report_location_qtys
    ADD CONSTRAINT "saved_stock_report_location_qtys_lineId_fkey" FOREIGN KEY ("lineId") REFERENCES public.saved_stock_report_lines(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3982 (class 2606 OID 83439)
-- Name: saved_stock_report_location_qtys saved_stock_report_location_qtys_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_report_location_qtys
    ADD CONSTRAINT "saved_stock_report_location_qtys_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3975 (class 2606 OID 83419)
-- Name: saved_stock_reports saved_stock_reports_approvalRequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_reports
    ADD CONSTRAINT "saved_stock_reports_approvalRequestId_fkey" FOREIGN KEY ("approvalRequestId") REFERENCES public.approval_requests(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3976 (class 2606 OID 83414)
-- Name: saved_stock_reports saved_stock_reports_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_reports
    ADD CONSTRAINT "saved_stock_reports_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3977 (class 2606 OID 83409)
-- Name: saved_stock_reports saved_stock_reports_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_reports
    ADD CONSTRAINT "saved_stock_reports_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3978 (class 2606 OID 83404)
-- Name: saved_stock_reports saved_stock_reports_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.saved_stock_reports
    ADD CONSTRAINT "saved_stock_reports_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3908 (class 2606 OID 82450)
-- Name: stock_balances stock_balances_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_balances
    ADD CONSTRAINT "stock_balances_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3909 (class 2606 OID 82455)
-- Name: stock_balances stock_balances_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_balances
    ADD CONSTRAINT "stock_balances_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3910 (class 2606 OID 82445)
-- Name: stock_balances stock_balances_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_balances
    ADD CONSTRAINT "stock_balances_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3928 (class 2606 OID 82540)
-- Name: stock_count_lines stock_count_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_lines
    ADD CONSTRAINT "stock_count_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3929 (class 2606 OID 82535)
-- Name: stock_count_lines stock_count_lines_sessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_lines
    ADD CONSTRAINT "stock_count_lines_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES public.stock_count_sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3923 (class 2606 OID 83229)
-- Name: stock_count_sessions stock_count_sessions_approvalRequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_sessions
    ADD CONSTRAINT "stock_count_sessions_approvalRequestId_fkey" FOREIGN KEY ("approvalRequestId") REFERENCES public.approval_requests(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3924 (class 2606 OID 82530)
-- Name: stock_count_sessions stock_count_sessions_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_sessions
    ADD CONSTRAINT "stock_count_sessions_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3925 (class 2606 OID 82525)
-- Name: stock_count_sessions stock_count_sessions_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_sessions
    ADD CONSTRAINT "stock_count_sessions_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3926 (class 2606 OID 83234)
-- Name: stock_count_sessions stock_count_sessions_movementDocumentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_sessions
    ADD CONSTRAINT "stock_count_sessions_movementDocumentId_fkey" FOREIGN KEY ("movementDocumentId") REFERENCES public.movement_documents(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3927 (class 2606 OID 82520)
-- Name: stock_count_sessions stock_count_sessions_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.stock_count_sessions
    ADD CONSTRAINT "stock_count_sessions_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3953 (class 2606 OID 83304)
-- Name: store_issue_lines store_issue_lines_issueId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issue_lines
    ADD CONSTRAINT "store_issue_lines_issueId_fkey" FOREIGN KEY ("issueId") REFERENCES public.store_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3954 (class 2606 OID 83314)
-- Name: store_issue_lines store_issue_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issue_lines
    ADD CONSTRAINT "store_issue_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3955 (class 2606 OID 83309)
-- Name: store_issue_lines store_issue_lines_requisitionLineId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issue_lines
    ADD CONSTRAINT "store_issue_lines_requisitionLineId_fkey" FOREIGN KEY ("requisitionLineId") REFERENCES public.store_requisition_lines(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3956 (class 2606 OID 83319)
-- Name: store_issue_lines store_issue_lines_uomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issue_lines
    ADD CONSTRAINT "store_issue_lines_uomId_fkey" FOREIGN KEY ("uomId") REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3950 (class 2606 OID 83299)
-- Name: store_issues store_issues_issuedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issues
    ADD CONSTRAINT "store_issues_issuedBy_fkey" FOREIGN KEY ("issuedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3951 (class 2606 OID 83294)
-- Name: store_issues store_issues_requisitionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issues
    ADD CONSTRAINT "store_issues_requisitionId_fkey" FOREIGN KEY ("requisitionId") REFERENCES public.store_requisitions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3952 (class 2606 OID 83289)
-- Name: store_issues store_issues_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_issues
    ADD CONSTRAINT "store_issues_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3947 (class 2606 OID 83279)
-- Name: store_requisition_lines store_requisition_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisition_lines
    ADD CONSTRAINT "store_requisition_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3948 (class 2606 OID 83274)
-- Name: store_requisition_lines store_requisition_lines_requisitionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisition_lines
    ADD CONSTRAINT "store_requisition_lines_requisitionId_fkey" FOREIGN KEY ("requisitionId") REFERENCES public.store_requisitions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3949 (class 2606 OID 83284)
-- Name: store_requisition_lines store_requisition_lines_uomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisition_lines
    ADD CONSTRAINT "store_requisition_lines_uomId_fkey" FOREIGN KEY ("uomId") REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3942 (class 2606 OID 83264)
-- Name: store_requisitions store_requisitions_approvedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT "store_requisitions_approvedBy_fkey" FOREIGN KEY ("approvedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3943 (class 2606 OID 83254)
-- Name: store_requisitions store_requisitions_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT "store_requisitions_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3944 (class 2606 OID 83269)
-- Name: store_requisitions store_requisitions_rejectedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT "store_requisitions_rejectedBy_fkey" FOREIGN KEY ("rejectedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3945 (class 2606 OID 83259)
-- Name: store_requisitions store_requisitions_requestedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT "store_requisitions_requestedBy_fkey" FOREIGN KEY ("requestedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3946 (class 2606 OID 83249)
-- Name: store_requisitions store_requisitions_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_requisitions
    ADD CONSTRAINT "store_requisitions_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3964 (class 2606 OID 83364)
-- Name: store_transfer_lines store_transfer_lines_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfer_lines
    ADD CONSTRAINT "store_transfer_lines_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3965 (class 2606 OID 83359)
-- Name: store_transfer_lines store_transfer_lines_transferId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfer_lines
    ADD CONSTRAINT "store_transfer_lines_transferId_fkey" FOREIGN KEY ("transferId") REFERENCES public.store_transfers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3966 (class 2606 OID 83369)
-- Name: store_transfer_lines store_transfer_lines_uomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfer_lines
    ADD CONSTRAINT "store_transfer_lines_uomId_fkey" FOREIGN KEY ("uomId") REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3957 (class 2606 OID 83344)
-- Name: store_transfers store_transfers_approvedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_approvedBy_fkey" FOREIGN KEY ("approvedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3958 (class 2606 OID 83334)
-- Name: store_transfers store_transfers_destLocationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_destLocationId_fkey" FOREIGN KEY ("destLocationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3959 (class 2606 OID 83354)
-- Name: store_transfers store_transfers_receivedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_receivedBy_fkey" FOREIGN KEY ("receivedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3960 (class 2606 OID 83349)
-- Name: store_transfers store_transfers_rejectedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_rejectedBy_fkey" FOREIGN KEY ("rejectedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3961 (class 2606 OID 83339)
-- Name: store_transfers store_transfers_requestedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_requestedBy_fkey" FOREIGN KEY ("requestedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3962 (class 2606 OID 83329)
-- Name: store_transfers store_transfers_sourceLocationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_sourceLocationId_fkey" FOREIGN KEY ("sourceLocationId") REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3963 (class 2606 OID 83324)
-- Name: store_transfers store_transfers_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.store_transfers
    ADD CONSTRAINT "store_transfers_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3887 (class 2606 OID 82360)
-- Name: subcategories subcategories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT "subcategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3888 (class 2606 OID 82355)
-- Name: subcategories subcategories_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT "subcategories_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3967 (class 2606 OID 83000)
-- Name: subscriptions subscriptions_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "subscriptions_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3969 (class 2606 OID 83010)
-- Name: super_admin_logs super_admin_logs_adminUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.super_admin_logs
    ADD CONSTRAINT "super_admin_logs_adminUserId_fkey" FOREIGN KEY ("adminUserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3970 (class 2606 OID 83374)
-- Name: super_admin_logs super_admin_logs_targetTenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.super_admin_logs
    ADD CONSTRAINT "super_admin_logs_targetTenantId_fkey" FOREIGN KEY ("targetTenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3896 (class 2606 OID 82395)
-- Name: suppliers suppliers_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT "suppliers_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3974 (class 2606 OID 83379)
-- Name: tenant_settings tenant_settings_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.tenant_settings
    ADD CONSTRAINT "tenant_settings_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3968 (class 2606 OID 83005)
-- Name: tenant_usage tenant_usage_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.tenant_usage
    ADD CONSTRAINT "tenant_usage_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3893 (class 2606 OID 82380)
-- Name: units units_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT "units_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3940 (class 2606 OID 82684)
-- Name: uom_mappings uom_mappings_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.uom_mappings
    ADD CONSTRAINT "uom_mappings_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3883 (class 2606 OID 83204)
-- Name: users users_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3941 (class 2606 OID 82689)
-- Name: vendor_mappings vendor_mappings_tenantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ose_user
--

ALTER TABLE ONLY public.vendor_mappings
    ADD CONSTRAINT "vendor_mappings_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES public.tenants(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ose_user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-03-20 05:17:58

--
-- PostgreSQL database dump complete
--

\unrestrict MdmXCEigRtw2qBZJJbXUKz0f3FPt3bbB1hHdEXEDWVCd4j1jp4SsnAbHfJQx82U

