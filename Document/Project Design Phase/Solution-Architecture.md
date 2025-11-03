# Solution Architecture

## Automated Ticket Routing System - Technical Architecture

**Project:** Streamlining Ticket Assignment for Efficient Support Operations  
**Team ID:** NM2025TMID08900  
**Version:** 1.0

---

## Architecture Overview

### System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        ABC Corporation                           │
│                     Support Ticket System                        │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                      ServiceNow Platform                         │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  - Ticket Creation                                       │  │
│  │  - Workflow Management                                   │  │
│  │  - User Interface                                        │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 │ REST API
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│               Spring Boot API Gateway                            │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  - Request Validation                                    │  │
│  │  - Authentication & Authorization                        │  │
│  │  - Rate Limiting                                         │  │
│  │  - Logging & Monitoring                                  │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                                 │
                    ┌────────────┴────────────┐
                    │                         │
                    ▼                         ▼
┌──────────────────────────────┐  ┌──────────────────────────────┐
│ TensorFlow ML Service        │  │  Business Logic Service      │
│  ┌────────────────────────┐  │  │  ┌────────────────────────┐  │
│  │ - Text Preprocessing   │  │  │  │ - Routing Rules        │  │
│  │ - Model Inference      │  │  │  │ - SLA Management       │  │
│  │ - Confidence Scoring   │  │  │  │ - Override Handling    │  │
│  │ - Model Retraining     │  │  │  │ - Audit Logging        │  │
│  └────────────────────────┘  │  │  └────────────────────────┘  │
└──────────────────────────────┘  └──────────────────────────────┘
                    │                         │
                    └────────────┬────────────┘
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│          Load Balancing & Assignment Service                    │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  - Team Capacity Monitoring                              │  │
│  │  - Workload Distribution                                 │  │
│  │  - Dynamic Assignment                                    │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                      PostgreSQL Database                         │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  - Ticket Data                                           │  │
│  │  - Team Information                                      │  │
│  │  - Routing History                                       │  │
│  │  - Performance Metrics                                   │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│             Support Teams (Network, Database, App, etc.)         │
└─────────────────────────────────────────────────────────────────┘
```

---

## Component Details

### 1. ServiceNow Platform (Presentation Layer)

**Purpose:** User interface and ticket management

**Components:**
- Ticket submission forms
- Agent dashboards
- Reporting interfaces
- Workflow automation

**Integration Points:**
- REST API to Spring Gateway
- Webhook notifications
- Business rules triggers

**Technology:**
- ServiceNow Platform
- ServiceNow Flow Designer
- ServiceNow REST API

---

### 2. Spring Boot API Gateway (Application Layer)

**Purpose:** Central entry point for all system requests

**Responsibilities:**
```java
@RestController
@RequestMapping("/api/v1/tickets")
public class TicketRoutingController {
    
    @PostMapping("/route")
    public ResponseEntity<RoutingResponse> routeTicket(
        @RequestBody TicketRequest request) {
        // Validate request
        // Call ML service
        // Apply business rules
        // Execute assignment
        // Return response
    }
}
```

**Key Features:**
- Request validation and sanitization
- JWT authentication
- Rate limiting (1000 requests/minute)
- Circuit breaker pattern
- Comprehensive logging

**Technology Stack:**
- Spring Boot 3.1
- Spring Security
- Spring Cloud Gateway
- Resilience4j

---

### 3. TensorFlow ML Service (Intelligence Layer)

**Purpose:** Machine learning-based ticket classification

**Model Architecture:**
```python
class TicketClassifier(tf.keras.Model):
    def __init__(self, vocab_size, num_classes):
        super().__init__()
        self.embedding = tf.keras.layers.Embedding(vocab_size, 128)
        self.lstm = tf.keras.layers.LSTM(256, return_sequences=True)
        self.lstm2 = tf.keras.layers.LSTM(128)
        self.dense1 = tf.keras.layers.Dense(64, activation='relu')
        self.dropout = tf.keras.layers.Dropout(0.3)
        self.dense2 = tf.keras.layers.Dense(num_classes, activation='softmax')
    
    def call(self, inputs):
        x = self.embedding(inputs)
        x = self.lstm(x)
        x = self.lstm2(x)
        x = self.dense1(x)
        x = self.dropout(x)
        return self.dense2(x)
```

**API Endpoints:**
```
POST /ml/predict
{
    "ticket_text": "Email server not responding",
    "priority": "high",
    "category": "infrastructure"
}

Response:
{
    "predicted_team": "network_team",
    "confidence": 0.96,
    "alternatives": [
        {"team": "email_team", "confidence": 0.78}
    ]
}
```

**Technology Stack:**
- TensorFlow 2.14
- TensorFlow Serving
- Python 3.11
- Docker containers

---

### 4. Business Logic Service (Rules Layer)

**Purpose:** Apply business rules and routing logic

**Key Classes:**
```java
@Service
public class RoutingEngine {
    
    public TeamAssignment determineTeam(
        TicketData ticket,
        MLPrediction prediction,
        TeamCapacity capacity) {
        
        // Apply confidence threshold
        if (prediction.getConfidence() < 0.90) {
            return routeToManualReview(ticket);
        }
        
        // Check team capacity
        Team predictedTeam = prediction.getTeam();
        if (capacity.isOverloaded(predictedTeam)) {
            return applyLoadBalancing(ticket, prediction);
        }
        
        // Standard assignment
        return assignToTeam(ticket, predictedTeam);
    }
}
```

**Business Rules:**
1. Confidence > 90% → Auto-assign
2. Confidence 70-90% → Suggest with manual review
3. Confidence < 70% → Manual queue
4. Team capacity > 80% → Load balance
5. High priority → Override capacity checks

**Technology:**
- Spring Boot
- Drools Rule Engine
- Java 17

---

### 5. Load Balancing Service

**Purpose:** Optimize team workload distribution

**Algorithm:**
```java
public Team selectOptimalTeam(
    List<Team> eligibleTeams,
    Priority priority) {
    
    // Calculate load scores
    Map<Team, Double> loadScores = new HashMap<>();
    for (Team team : eligibleTeams) {
        double score = calculateLoadScore(team);
        loadScores.put(team, score);
    }
    
    // Priority weighting
    if (priority == Priority.HIGH) {
        return eligibleTeams.get(0); // Best match
    }
    
    // Return least loaded team
    return loadScores.entrySet().stream()
        .min(Map.Entry.comparingByValue())
        .get().getKey();
}
```

**Metrics Tracked:**
- Active tickets per team
- Average resolution time
- Team availability
- Skill match percentage

---

### 6. Data Layer (PostgreSQL)

**Database Schema:**

```sql
-- Tickets Table
CREATE TABLE tickets (
    ticket_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority VARCHAR(20),
    category VARCHAR(50),
    assigned_team VARCHAR(50),
    status VARCHAR(20),
    created_at TIMESTAMP,
    assigned_at TIMESTAMP,
    resolved_at TIMESTAMP
);

-- Teams Table
CREATE TABLE teams (
    team_id VARCHAR(50) PRIMARY KEY,
    team_name VARCHAR(100),
    specialization VARCHAR(100),
    max_capacity INTEGER,
    current_load INTEGER,
    availability_status VARCHAR(20)
);

-- Routing History
CREATE TABLE routing_history (
    id SERIAL PRIMARY KEY,
    ticket_id VARCHAR(50),
    ml_prediction VARCHAR(50),
    confidence_score DECIMAL(3,2),
    actual_assignment VARCHAR(50),
    was_correct BOOLEAN,
    feedback_timestamp TIMESTAMP
);

-- Performance Metrics
CREATE TABLE metrics (
    metric_id SERIAL PRIMARY KEY,
    metric_date DATE,
    avg_assignment_time INTEGER,
    routing_accuracy DECIMAL(5,2),
    total_tickets INTEGER,
    misrouted_count INTEGER
);
```

---

## Data Flow

### Ticket Routing Flow

**1. Ticket Creation**
```
User creates ticket → ServiceNow → POST /api/v1/tickets/route
```

**2. Request Processing**
```
API Gateway → Validate → Authenticate → Route to services
```

**3. ML Prediction**
```
Business Service → ML Service API → TensorFlow Model → Prediction
```

**4. Business Rules**
```
Apply routing rules → Check capacity → Determine final team
```

**5. Assignment Execution**
```
Update database → Notify ServiceNow → Alert team → Start SLA
```

**6. Feedback Loop**
```
Track resolution → Collect feedback → Retrain model → Improve accuracy
```

---

## Deployment Architecture

### Infrastructure

```
┌─────────────────────────────────────────────────────────────┐
│                    Cloud Infrastructure (AWS/Azure)          │
│                                                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │   Load      │  │   Load      │  │   Load      │        │
│  │  Balancer   │  │  Balancer   │  │  Balancer   │        │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘        │
│         │                │                │                 │
│  ┌──────▼──────┐  ┌─────▼──────┐  ┌──────▼──────┐        │
│  │  API        │  │  ML         │  │  Business   │        │
│  │  Gateway    │  │  Service    │  │  Service    │        │
│  │  (3 nodes)  │  │  (2 nodes)  │  │  (3 nodes)  │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
│                                                              │
│  ┌──────────────────────────────────────────────┐          │
│  │        PostgreSQL (Primary + Replicas)        │          │
│  └──────────────────────────────────────────────┘          │
│                                                              │
│  ┌──────────────────────────────────────────────┐          │
│  │           Monitoring & Logging                │          │
│  │   (Prometheus, Grafana, ELK Stack)            │          │
│  └──────────────────────────────────────────────┘          │
└─────────────────────────────────────────────────────────────┘
```

### Container Strategy
- Docker containers for all services
- Kubernetes for orchestration
- Auto-scaling based on load
- Health checks and self-healing

---

## Security Architecture

### Authentication & Authorization
- JWT tokens for API authentication
- OAuth 2.0 for ServiceNow integration
- Role-based access control (RBAC)
- Service-to-service mutual TLS

### Data Protection
- Encryption at rest (AES-256)
- Encryption in transit (TLS 1.3)
- PII data masking in logs
- Regular security audits

### Network Security
- VPC isolation
- Firewall rules
- DDoS protection
- API rate limiting

---

## Performance Specifications

### Response Times
- API Gateway: <50ms
- ML Prediction: <5 seconds
- Database queries: <100ms
- End-to-end routing: <30 seconds

### Scalability
- Horizontal scaling for all services
- Support 10,000+ tickets/day
- Auto-scaling at 70% CPU
- 99.9% uptime SLA

### Reliability
- Multi-region deployment
- Automatic failover
- Database replication
- Circuit breaker patterns

---

## Monitoring & Observability

### Metrics Collected
- Request latency
- Error rates
- ML model accuracy
- Team workload
- System health

### Dashboards
- Real-time routing metrics
- Team performance analytics
- System health monitoring
- Cost optimization

### Alerting
- Performance degradation
- Error rate spikes
- Capacity thresholds
- Security incidents

---

**Document Status:** Approved  
**Implementation Team:** NM2025TMID08900  
**Next Phase:** Development Sprint Planning
