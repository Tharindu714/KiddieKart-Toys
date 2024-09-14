package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.Validations;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

@WebServlet(name = "LoadSingleProduct", urlPatterns = {"/LoadSingleProduct"})
public class LoadSingleProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {

            String productId = request.getParameter("pid");

            if (Validations.isInteger(productId)) {

                Product product = (Product) session.get(Product.class, Integer.parseInt(productId));
                product.getUser().setEmail(null);
                product.getUser().setVerification(null);
                product.getUser().setPassword(null);

                

                Criteria criteria2 = session.createCriteria(Product.class);
                criteria2.add(Restrictions.ne("id", product.getId()));
                criteria2.setMaxResults(6);

                List<Product> productList = criteria2.list();

                for (Product product1 : productList) {
                    product1.getUser().setEmail(null);
                    product1.getUser().setVerification(null);
                    product1.getUser().setPassword(null);
                }
                
                JsonObject jsonObject = new JsonObject();
                jsonObject.add("product", gson.toJsonTree(product));
                jsonObject.add("productList", gson.toJsonTree(productList));

                session.close();
                response.setContentType("application/json");
                response.getWriter().write(gson.toJson(jsonObject));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
