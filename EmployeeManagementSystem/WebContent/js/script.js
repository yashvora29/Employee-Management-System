/**
 * Employee Management System - Frontend Scripts
 */

document.addEventListener('DOMContentLoaded', function() {
    // 1. Tooltip initialization if any (Bootstrap 5)
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });

    // 2. Form Validation
    const forms = document.querySelectorAll('.needs-validation');
    
    Array.prototype.slice.call(forms).forEach(function(form) {
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            // Custom Validation for specific fields
            if (!validateCustomFields(form)) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });
});

/**
 * Custom validation for specific fields like Email and Salary
 */
function validateCustomFields(form) {
    let isValid = true;

    // Email validation
    const emailField = form.querySelector('input[type="email"]');
    if (emailField) {
        const emailRegex = /^[A-Za-z0-9+_.-]+@(.+)$/;
        if (!emailRegex.test(emailField.value)) {
            emailField.setCustomValidity('Invalid email format');
            isValid = false;
        } else {
            emailField.setCustomValidity('');
        }
    }

    // Salary validation (should be positive)
    const salaryField = form.querySelector('input[name="salary"]');
    if (salaryField) {
        const salary = parseFloat(salaryField.value);
        if (isNaN(salary) || salary <= 0) {
            salaryField.setCustomValidity('Salary must be a positive number');
            isValid = false;
        } else {
            salaryField.setCustomValidity('');
        }
    }

    return isValid;
}

/**
 * Confirmation dialog before deleting an employee
 */
function confirmDelete(id) {
    if (confirm('Are you sure you want to delete this employee record? This action cannot be undone.')) {
        window.location.href = 'deleteEmployee?id=' + id;
    }
}

/**
 * Auto-hide alerts after 5 seconds
 */
window.setTimeout(function() {
    const alerts = document.querySelectorAll('.alert-dismissible');
    alerts.forEach(alert => {
        const bsAlert = new bootstrap.Alert(alert);
        bsAlert.close();
    });
}, 5000);
