package com.customer.api.infrastructure.repository.postgres;

import com.customer.api.domain.Customer;
import com.customer.api.domain.repository.CustomerRepository;
import com.customer.api.infrastructure.repository.exception.RegisterNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

import java.util.Objects;
import java.util.UUID;

import static org.springframework.transaction.annotation.Propagation.REQUIRES_NEW;

@Repository
@RequiredArgsConstructor
public class CustomerRepositoryImpl implements CustomerRepository {

    private final CustomerDAO repository;

    //@Transactional(propagation = REQUIRES_NEW)
    public Mono<Customer> save(Customer customer) {
        final var entity = this.repository.save(new CustomerEntity(customer));
        return entity.map(CustomerEntity::toDomain);
    }

    public Mono<Customer> get(UUID id) {
        return this.repository
                .findById(id)
                .map(CustomerEntity::toDomain)
                .switchIfEmpty(Mono.error(RegisterNotFoundException::new));
    }


    //@Transactional
    public Mono<Boolean> existsByEmail(final String email) {
        return this.repository.findByEmail(email)
                .flatMap(customerEntity -> {
                    if (Objects.nonNull(customerEntity)) {
                        return Mono.just(Boolean.TRUE);
                    } else {
                        return Mono.just(Boolean.FALSE);
                    }
                });
    }

    public Mono<Void> delete(UUID id) {
        return this.repository.deleteById(id);
    }
}