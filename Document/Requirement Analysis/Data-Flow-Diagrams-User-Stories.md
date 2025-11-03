# Data Flow Diagrams and User Stories

## Streamlining Ticket Assignment for Efficient Support Operations

**Team ID:** NM2025TMID08900  
**Date:** November 3, 2025

---

## Data Flow Diagrams

### Level 0: Context Diagram

```
┌──────────────┐                                    ┌──────────────────┐
│              │      Submit Ticket                 │                  │
│   Customer   ├───────────────────────────────────>│  Automated       │
│              │                                    │  Ticket          │
│              │<───────────────────────────────────┤  Routing         │
│              │      Resolution Updates            │  System          │
└──────────────┘                                    │                  │
                                                     │                  │
┌──────────────┐                                    │                  │
│              │      View Assigned Tickets         │                  │
│   Support    │<───────────────────────────────────┤                  │
│   Teams      │                                    │                  │
│              ├───────────────────────────────────>│                  │
│              │      Update Ticket Status          │                  │
└──────────────┘                                    │                  │
                                                     │                  │
┌──────────────┐                                    │                  │
│              │      Configure Rules               │                  │
│   System     │<───────────────────────────────────┤                  │
│   Admin      │                                    │                  │
│              ├───────────────────────────────────>│                  │
│              │      View Analytics                │                  │
└──────────────┘                                    └──────────────────┘
```

---

### Level 1: System Process Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    Ticket Ingestion Process                      │
└─────────────────────────────────────────────────────────────────┘
                             │
                             ▼
    ┌────────────────────────────────────────────┐
    │  1.0 Receive & Validate Ticket             │
    │  Input: Ticket data from ServiceNow        │
    │  Output: Validated ticket object           │
    └───────────────┬────────────────────────────┘
                    │
                    ▼
    ┌────────────────────────────────────────────┐
    │  2.0 Preprocess Ticket Data                │
    │  Input: Validated ticket                   │
    │  Output: Preprocessed text + metadata      │
    └───────────────┬────────────────────────────┘
                    │
                    ▼
    ┌────────────────────────────────────────────┐
    │  3.0 ML Classification                     │
    │  Input: Preprocessed data                  │
    │  Output: Team prediction + confidence      │
    └───────────────┬────────────────────────────┘
                    │
                    ▼
    ┌────────────────────────────────────────────┐
    │  4.0 Apply Business Rules                  │
    │  Input: ML prediction, team capacity       │
    │  Output: Final team assignment             │
    └───────────────┬────────────────────────────┘
                    │
                    ▼
    ┌────────────────────────────────────────────┐
    │  5.0 Execute Assignment                    │
    │  Input: Team assignment decision           │
    │  Output: Updated ticket in ServiceNow      │
    └───────────────┬────────────────────────────┘
                    │
                    ▼
    ┌────────────────────────────────────────────┐
    │  6.0 Notify Team & Log                     │
    │  Input: Assignment details                 │
    │  Output: Notifications + audit logs        │
    └────────────────────────────────────────────┘
```

---

### Level 2: ML Classification Detailed Flow

```
Preprocessed Ticket Data
         │
         ▼
┌──────────────────────┐
│ Text Tokenization    │
│ - Remove stopwords   │
│ - Lemmatization      │
│ - Create vectors     │
└──────┬───────────────┘
       │
       ▼
┌──────────────────────┐
│ Feature Extraction   │
│ - TF-IDF scoring     │
│ - Metadata features  │
│ - Priority encoding  │
└──────┬───────────────┘
       │
       ▼
┌──────────────────────┐
│ Model Inference      │
│ - Neural network     │
│ - Team prediction    │
│ - Confidence score   │
└──────┬───────────────┘
       │
       ▼
┌──────────────────────┐
│ Confidence Check     │
│ >90%: Auto-assign    │
│ 70-90%: Suggest      │
│ <70%: Manual review  │
└──────────────────────┘
```

---

## User Stories

### Epic 1: Automated Ticket Routing

#### Story 1.1: As a customer, I want my support ticket to be automatically assigned to the right team so that I get help faster.

**Acceptance Criteria:**
- Ticket is assigned within 30 seconds of submission
- Assignment accuracy is >95%
- I receive confirmation of assignment
- I can see which team is working on my ticket

**Priority:** High  
**Story Points:** 8

---

#### Story 1.2: As a support agent, I want to receive only tickets relevant to my team's expertise so that I can provide better quality support.

**Acceptance Criteria:**
- Tickets match my team's specialization
- I can see why the ticket was assigned to my team
- I can request reassignment if needed
- Misrouted tickets are <5%

**Priority:** High  
**Story Points:** 5

---

#### Story 1.3: As a system admin, I want to configure routing rules and thresholds so that I can optimize the system for our organization.

**Acceptance Criteria:**
- I can set confidence thresholds
- I can define team specializations
- I can adjust load balancing parameters
- Changes take effect immediately

**Priority:** Medium  
**Story Points:** 5

---

### Epic 2: Load Balancing

#### Story 2.1: As a team lead, I want tickets distributed evenly among all teams so that no team is overwhelmed.

**Acceptance Criteria:**
- Workload variance is within ±10%
- Real-time capacity monitoring
- Automatic load balancing when threshold exceeded
- Dashboard shows current team loads

**Priority:** High  
**Story Points:** 8

---

#### Story 2.2: As a support agent, I don't want to be assigned new tickets when my queue is full so that I can maintain quality service.

**Acceptance Criteria:**
- System checks my current workload
- Tickets routed to less busy team members
- I can set my availability status
- Urgent tickets can override capacity limits

**Priority:** Medium  
**Story Points:** 5

---

### Epic 3: Machine Learning & Accuracy

#### Story 3.1: As a data scientist, I want the ML model to continuously learn from feedback so that routing accuracy improves over time.

**Acceptance Criteria:**
- Feedback loop captures resolution outcomes
- Model retraining occurs weekly
- Accuracy metrics tracked and reported
- A/B testing for model improvements

**Priority:** High  
**Story Points:** 13

---

#### Story 3.2: As a system admin, I want to see detailed accuracy metrics so that I can assess system performance.

**Acceptance Criteria:**
- Dashboard shows routing accuracy
- Historical trend analysis
- Breakdown by team and category
- Misrouting pattern identification

**Priority:** Medium  
**Story Points:** 5

---

### Epic 4: Integration & Workflow

#### Story 4.1: As a ServiceNow admin, I want seamless integration with our existing ITSM platform so that we don't disrupt current workflows.

**Acceptance Criteria:**
- API integration with ServiceNow
- Existing workflows remain functional
- Assignment updates appear in real-time
- Audit trail maintained

**Priority:** High  
**Story Points:** 13

---

#### Story 4.2: As a support manager, I want to override automatic assignments when necessary so that I maintain control in special situations.

**Acceptance Criteria:**
- Manual override button available
- Reason for override captured
- Override doesn't affect ML learning
- Audit log records all overrides

**Priority:** Medium  
**Story Points:** 3

---

### Epic 5: Monitoring & Reporting

#### Story 5.1: As a support manager, I want real-time dashboards showing system performance so that I can monitor operations effectively.

**Acceptance Criteria:**
- Live routing statistics
- Team workload visualization
- SLA compliance tracking
- Alert notifications for issues

**Priority:** Medium  
**Story Points:** 8

---

#### Story 5.2: As an executive, I want monthly reports on efficiency gains so that I can measure ROI.

**Acceptance Criteria:**
- Automated monthly reports
- Key metrics: time saved, accuracy, CSAT
- Comparison to baseline metrics
- Cost savings calculation

**Priority:** Low  
**Story Points:** 5

---

## Data Dictionary

### Ticket Entity
| Field | Type | Description | Source |
|-------|------|-------------|--------|
| ticket_id | String | Unique identifier | ServiceNow |
| title | String | Ticket title | Customer input |
| description | Text | Detailed description | Customer input |
| priority | Enum | High/Medium/Low | Auto or manual |
| category | String | Issue category | Customer selection |
| assigned_team | String | Target team | ML prediction |
| confidence_score | Float | ML confidence | TensorFlow model |
| created_at | Timestamp | Creation time | System |
| assigned_at | Timestamp | Assignment time | System |

### Team Entity
| Field | Type | Description | Source |
|-------|------|-------------|--------|
| team_id | String | Unique identifier | Configuration |
| team_name | String | Display name | Configuration |
| specialization | String | Area of expertise | Configuration |
| max_capacity | Integer | Max active tickets | Configuration |
| current_load | Integer | Current tickets | Real-time |

---

## Use Case Specifications

### Use Case 1: Route High-Priority Ticket

**Actor:** System  
**Preconditions:** Ticket created in ServiceNow  
**Trigger:** Ticket priority = High

**Main Flow:**
1. System receives high-priority ticket
2. System bypasses load balancing
3. ML model predicts best team
4. System assigns to predicted team immediately
5. System sends urgent notification
6. SLA clock starts

**Alternate Flow:**
- If predicted team at max capacity, escalate to manager

**Postconditions:** Ticket assigned within 10 seconds

---

### Use Case 2: Handle Low-Confidence Prediction

**Actor:** System, Support Manager  
**Preconditions:** ML confidence < 70%  
**Trigger:** Low confidence score

**Main Flow:**
1. System identifies low confidence
2. System routes to manual review queue
3. Manager reviews ticket details
4. Manager assigns to appropriate team
5. System logs manual decision
6. ML model learns from manual assignment

**Postconditions:** Ticket manually assigned, data captured for learning

---

## Sequence Diagrams

### Ticket Assignment Sequence

```
Customer    ServiceNow    API Gateway    ML Service    Business Logic    Database
   │             │              │              │               │             │
   ├─Submit─────>│              │              │               │             │
   │             ├──POST────────>│              │               │             │
   │             │              ├──Predict─────>│               │             │
   │             │              │              ├──Result───────>│             │
   │             │              │              │               ├──Save──────>│
   │             │              │              │               │<──OK────────┤
   │             │<──Assigned───┤              │               │             │
   │<──Confirm───┤              │              │               │             │
```

---

**Document Status:** Approved  
**Team:** NM2025TMID08900
