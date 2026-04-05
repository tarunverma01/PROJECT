using { db } from '../db/schema';

service CatalogService {
    entity Companies as projection on db.Companies;
    entity Students as projection on db.Students;
    entity JobApplications as projection on db.JobApplications;
}
