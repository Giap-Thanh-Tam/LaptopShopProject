package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("Order not found with id: " + id));
    }

    public void handleSaveOrder(Order order) {
        Optional<Order> od = this.orderRepository.findById(order.getId());
        if (od.isPresent()) {
            Order currentOrder = od.get();

            this.orderRepository.save(currentOrder);
        }
    }

    public void deleteAnOrder(long id) {
        Order order = this.getOrderById(id);
        List<OrderDetail> orderDetails = order.getOrderDetail();

        for (OrderDetail orderDetail2 : orderDetails) {
            this.orderDetailRepository.deleteById(orderDetail2.getId());
        }

        this.orderRepository.deleteById(order.getId());
    }

}
