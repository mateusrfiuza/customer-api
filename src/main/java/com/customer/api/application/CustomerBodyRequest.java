package com.customer.api.application;

import com.customer.api.domain.Customer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerBodyRequest {

    @NotEmpty
    private String name;

    @Email
    @NotEmpty
    private String email;

    public Customer toDomain() {
        var customer = new Customer();
        customer.setEmail(this.email);
        customer.setName(this.name);

        return customer;
    }


}