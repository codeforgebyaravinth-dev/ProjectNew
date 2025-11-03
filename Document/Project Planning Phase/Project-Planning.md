# Project Planning Document

## Streamlining Ticket Assignment for Efficient Support Operations

**Team ID:** NM2025TMID08900  
**Project Duration:** 8 Weeks  
**Start Date:** Week 1  
**End Date:** Week 8

---

## Executive Summary

This project planning document outlines the implementation strategy for an AI-powered automated ticket routing system at ABC Corporation. The system will leverage TensorFlow for machine learning and Spring framework for backend services to achieve automated, accurate, and efficient support ticket assignment.

**Project Objectives:**
- Reduce ticket assignment time from 30 minutes to <30 seconds
- Achieve >95% routing accuracy
- Balance workload across support teams (±10% variance)
- Improve customer satisfaction through faster response times
- Enable scalability for future growth

---

## Team Structure

### Team Members

| Name | Role | Responsibilities |
|------|------|------------------|
| Aravinth V | Team Leader & Backend Developer | Spring Boot development, System architecture, Project coordination |
| Jagan P | ML Engineer | TensorFlow model development, Training pipeline, Model deployment |
| Subash Chandrabose K | Full Stack Developer | API integration, ServiceNow connector, Frontend dashboard |
| Aravinth M | DevOps Engineer | CI/CD pipeline, Cloud infrastructure, Monitoring setup |

---

## Project Phases

### Phase 1: Project Setup & Planning (Week 1)

**Objectives:**
- Finalize requirements
- Set up development environment
- Establish team processes

**Tasks:**

| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| Requirements review & sign-off | Aravinth V | 1 day | None |
| Development environment setup | All | 2 days | None |
| Git repository creation | Aravinth M | 1 day | None |
| Database schema design | Aravinth V | 2 days | Requirements |
| CI/CD pipeline setup | Aravinth M | 2 days | Git repo |
| Team kick-off meeting | All | 0.5 day | None |

**Deliverables:**
- ✅ Approved requirements document
- ✅ Development environment ready
- ✅ Git workflow established
- ✅ Database schema approved
- ✅ CI/CD pipeline functional

**Success Criteria:**
- All team members can commit code
- Database schema reviewed and approved
- CI/CD pipeline runs successfully

---

### Phase 2: Data Collection & Preparation (Week 2)

**Objectives:**
- Collect historical ticket data
- Prepare training dataset
- Validate data quality

**Tasks:**

| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| Extract historical tickets from ServiceNow | Subash K | 2 days | Database setup |
| Data cleaning & preprocessing | Jagan P | 3 days | Data extraction |
| Data labeling & validation | Jagan P | 2 days | Preprocessing |
| Train/test split creation | Jagan P | 1 day | Labeling |
| Data quality report | Jagan P | 1 day | Dataset ready |

**Deliverables:**
- ✅ 50,000+ labeled tickets
- ✅ Training dataset (80%)
- ✅ Validation dataset (10%)
- ✅ Test dataset (10%)
- ✅ Data quality report

**Success Criteria:**
- Dataset has balanced class distribution
- Data quality metrics meet thresholds
- No missing or corrupt data

---

### Phase 3: ML Model Development (Weeks 3-4)

**Objectives:**
- Develop TensorFlow classification model
- Train and validate model
- Achieve target accuracy

**Tasks:**

**Week 3:**
| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| Text preprocessing pipeline | Jagan P | 3 days | Dataset ready |
| Baseline model development | Jagan P | 2 days | Preprocessing |
| Model architecture design | Jagan P | 2 days | Baseline |
| Initial training run | Jagan P | 1 day | Architecture |
| Model evaluation | Jagan P | 1 day | Training |

**Week 4:**
| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| Model optimization | Jagan P | 3 days | Evaluation |
| Hyperparameter tuning | Jagan P | 2 days | Optimization |
| Cross-validation | Jagan P | 2 days | Tuning |
| Final model training | Jagan P | 1 day | Validation |
| Model deployment package | Jagan P | 1 day | Final model |

**Deliverables:**
- ✅ Trained TensorFlow model
- ✅ Model accuracy >95%
- ✅ Model inference API
- ✅ Model documentation
- ✅ Performance metrics report

**Success Criteria:**
- Routing accuracy >95% on test set
- Prediction latency <5 seconds
- Model can be served via API

---

### Phase 4: Backend Development (Weeks 5-6)

**Objectives:**
- Develop Spring Boot backend
- Implement business logic
- Create API endpoints

**Tasks:**

**Week 5:**
| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| Spring Boot project setup | Aravinth V | 1 day | Phase 1 |
| Database integration (JPA) | Aravinth V | 2 days | DB schema |
| REST API development | Aravinth V | 3 days | Project setup |
| Load balancing service | Aravinth V | 2 days | API |
| Business rules engine | Aravinth V | 2 days | API |

**Week 6:**
| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| ServiceNow connector | Subash K | 3 days | API ready |
| Authentication & authorization | Aravinth V | 2 days | API |
| Notification service | Subash K | 2 days | Connector |
| API documentation (Swagger) | Subash K | 1 day | API complete |
| Unit tests | All | 2 days | Features complete |

**Deliverables:**
- ✅ Spring Boot application
- ✅ REST API endpoints
- ✅ ServiceNow integration
- ✅ Business logic layer
- ✅ API documentation
- ✅ Unit test coverage >80%

**Success Criteria:**
- All APIs functional
- ServiceNow integration tested
- Unit tests passing
- API documentation complete

---

### Phase 5: Integration & Testing (Week 7)

**Objectives:**
- Integrate all components
- Perform comprehensive testing
- Fix identified issues

**Tasks:**

| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| ML model integration | Aravinth V, Jagan P | 2 days | Phases 3 & 4 |
| End-to-end integration | All | 2 days | Model integration |
| Integration testing | All | 2 days | Integration |
| Performance testing | Aravinth M | 2 days | Integration |
| Security testing | Aravinth M | 1 day | Integration |
| Bug fixes | All | 2 days | Testing |
| Load testing | Aravinth M | 1 day | Performance |

**Deliverables:**
- ✅ Fully integrated system
- ✅ Integration test results
- ✅ Performance test report
- ✅ Security audit report
- ✅ Bug fix log

**Success Criteria:**
- All integration tests passing
- End-to-end flow working
- Performance meets SLAs
- Security scan clean

---

### Phase 6: Deployment & Go-Live (Week 8)

**Objectives:**
- Deploy to production
- Monitor system performance
- Support go-live activities

**Tasks:**

| Task | Owner | Duration | Dependencies |
|------|-------|----------|--------------|
| Production environment setup | Aravinth M | 2 days | Phase 7 |
| Database migration | Aravinth M | 1 day | Env setup |
| Production deployment | Aravinth M | 1 day | Migration |
| Smoke testing | All | 1 day | Deployment |
| Monitoring setup | Aravinth M | 1 day | Deployment |
| User training | Subash K | 2 days | Deployment |
| Documentation finalization | All | 1 day | System ready |
| Go-live support | All | 2 days | Training |
| Post-launch review | All | 1 day | Go-live |

**Deliverables:**
- ✅ Production deployment
- ✅ Monitoring dashboards
- ✅ User training materials
- ✅ System documentation
- ✅ Go-live checklist
- ✅ Support procedures

**Success Criteria:**
- System live in production
- Zero critical bugs
- Monitoring active
- Users trained

---

## Project Timeline

### Gantt Chart Overview

```
Week 1: [████] Setup & Planning
Week 2: [████] Data Preparation
Week 3: [████████] ML Model Development
Week 4: [████████] ML Model Development
Week 5: [████████] Backend Development
Week 6: [████████] Backend Development
Week 7: [████████] Integration & Testing
Week 8: [████] Deployment & Go-Live
```

---

## Resource Allocation

### Human Resources

| Team Member | Hours/Week | Total Hours |
|-------------|-----------|-------------|
| Aravinth V | 40 | 320 |
| Jagan P | 40 | 320 |
| Subash Chandrabose K | 40 | 320 |
| Aravinth M | 40 | 320 |
| **Total** | **160** | **1,280** |

### Infrastructure Resources

| Resource | Cost | Duration |
|----------|------|----------|
| Cloud compute (AWS/Azure) | Variable | 8 weeks |
| Database (PostgreSQL) | Included | 8 weeks |
| Development tools | Included | 8 weeks |
| ServiceNow instance | Existing | N/A |

---

## Risk Management

### Risk Register

| Risk | Probability | Impact | Mitigation | Owner |
|------|------------|--------|------------|-------|
| Insufficient training data | Medium | High | Augment with synthetic data | Jagan P |
| ServiceNow API changes | Low | High | API versioning, monitoring | Subash K |
| Model accuracy below target | Medium | High | Multiple model architectures | Jagan P |
| Integration delays | Medium | Medium | Early integration testing | Aravinth V |
| Performance issues | Low | Medium | Load testing in week 7 | Aravinth M |
| Team member unavailability | Low | Medium | Knowledge sharing, documentation | All |

---

## Communication Plan

### Meetings

**Daily Standup:**
- Time: 9:00 AM
- Duration: 15 minutes
- Purpose: Progress updates, blockers

**Weekly Review:**
- Time: Friday 3:00 PM
- Duration: 1 hour
- Purpose: Week review, next week planning

**Sprint Reviews:**
- Frequency: Every 2 weeks
- Duration: 2 hours
- Purpose: Demo, retrospective

### Communication Channels

- **Slack:** Daily communication
- **Email:** Formal updates
- **GitHub:** Code reviews, issues
- **Confluence:** Documentation
- **Jira:** Task tracking

---

## Quality Assurance

### Testing Strategy

**Unit Testing:**
- Coverage target: >80%
- Framework: JUnit (Java), pytest (Python)
- Automated in CI/CD

**Integration Testing:**
- End-to-end scenarios
- ServiceNow integration
- API contract testing

**Performance Testing:**
- Load testing: 2,000 tickets/day
- Stress testing: 5,000 tickets/day
- Response time validation

**Security Testing:**
- OWASP Top 10 checks
- Penetration testing
- Dependency scanning

---

## Success Metrics

### Key Performance Indicators

| KPI | Baseline | Target | Measurement |
|-----|----------|--------|-------------|
| Assignment Time | 30 min | <30 sec | System logs |
| Routing Accuracy | 82% | >95% | ML validation |
| Misrouting Rate | 18% | <5% | Feedback data |
| Workload Balance | 40% var | ±10% var | Team metrics |
| System Uptime | N/A | 99.9% | Monitoring |
| Customer Satisfaction | 72% | >90% | CSAT surveys |

---

## Budget Breakdown

### Estimated Costs

| Category | Estimated Cost | Notes |
|----------|---------------|-------|
| Cloud Infrastructure | $2,000 | 8 weeks AWS/Azure |
| Third-party Services | $500 | Monitoring, logging |
| Training & Documentation | $1,000 | Materials, resources |
| Contingency (10%) | $350 | Buffer for overruns |
| **Total** | **$3,850** | 8-week project |

*Note: Team salaries not included (internal resources)*

---

## Assumptions & Dependencies

### Assumptions
- Historical ticket data is available and accessible
- ServiceNow API access will be granted promptly
- Cloud infrastructure resources available as needed
- Team members available full-time for 8 weeks
- Support teams will participate in UAT

### Dependencies
- ServiceNow platform team for API access
- Security team for production deployment approval
- IT team for infrastructure provisioning
- Management for go-live approval
- Support teams for feedback and testing

---

## Project Governance

### Decision-Making Authority

| Level | Decision | Authority |
|-------|----------|-----------|
| Strategic | Project scope changes | Management |
| Tactical | Technical architecture | Team Leader |
| Operational | Daily tasks | Team Members |

### Change Management

**Change Request Process:**
1. Submit change request
2. Impact analysis
3. Team Leader review
4. Stakeholder approval (if needed)
5. Implementation planning
6. Communication to team

---

## Post-Launch Plan

### Week 9-12: Stabilization

**Activities:**
- Monitor system performance
- Address production issues
- Collect user feedback
- Fine-tune ML model
- Optimize performance

**Support Model:**
- On-call rotation
- Incident response procedures
- Weekly performance reviews

### Continuous Improvement

- Model retraining schedule (weekly)
- Performance optimization
- Feature enhancements
- User feedback incorporation

---

## Project Closure

### Final Deliverables

- ✅ Production system
- ✅ Source code repository
- ✅ System documentation
- ✅ User manuals
- ✅ Training materials
- ✅ Operations runbooks
- ✅ Project retrospective

### Success Criteria for Project Completion

- All functional requirements met
- System live in production
- Performance targets achieved
- User acceptance sign-off
- Documentation complete
- Knowledge transfer done

---

**Document Status:** Approved  
**Team:** NM2025TMID08900  
**Project Manager:** Aravinth V  
**Last Updated:** November 3, 2025
