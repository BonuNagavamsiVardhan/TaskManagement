package com.klu.TaskManagement.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @Temporal(TemporalType.TIMESTAMP)
    private Date submissionDate;

    @Lob
    @Column(columnDefinition = "LONGBLOB") // Define column type as LONGBLOB for large binary data
    private byte[] pdfFile; // Use byte[] to store PDF file as binary data

    // Getter and setter for pdfFile

    public byte[] getPdfFile() {
        return pdfFile;
    }

    public void setPdfFile(byte[] pdfFile) {
        this.pdfFile = pdfFile;
    }

    private boolean submitted;

    @ManyToOne(cascade = CascadeType.ALL) // Add cascade attribute for all operations
    @JoinColumn(name = "user_id")
    private User user;

        // Constructors, getters, setters...
        
        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

    // Getters and setters

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }


    public boolean isSubmitted() {
        return submitted;
    }

    public void setSubmitted(boolean submitted) {
        this.submitted = submitted;
    }
}
