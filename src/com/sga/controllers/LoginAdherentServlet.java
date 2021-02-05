package com.sga.controllers;

import com.sga.entities.Adherent;
import com.sga.entities.Fonction;
import com.sga.entities.LigneFonction;
import com.sga.repositories.Repository;
import com.sga.repositories.RepositoryFactory;
import com.sga.services.LoginAdherentForm;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Servlet implementation class DashBoardDonateurServlet
 */
@WebServlet( "/loginAdherent" )
public class LoginAdherentServlet extends HttpServlet {

    /**
     * 
     */
    private static final long  serialVersionUID = 1L;
    public static final String VUE_LOGIN        = "/WEB-INF/loginAdherent.jsp";
    public static final String ATT_SESSION_USER = "user";
    public static final String  COOKIE_DERNIERE_CONNEXION = "derniereConnexion";
    public static final String  FORMAT_DATE               = "dd/MM/yyyy";
    public static final String  CHAMP_MEMOIRE             = "memoire";
    public static final int     COOKIE_MAX_AGE            = 60 * 60 * 24 * 365;  // 1 an
	private static final String ATT_LOGIN_ADHERENT_FORM = "LoginAdherentForm";


    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
            this.getServletContext().getRequestDispatcher(VUE_LOGIN).forward(request, response);

    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session =req.getSession();
        Adherent user = (Adherent) session.getAttribute(ATT_SESSION_USER);


        LoginAdherentForm adherentForm = new LoginAdherentForm();
        user = adherentForm.creerAdherent(req);

        if(!adherentForm.getErreurs().isEmpty())
            session.setAttribute(ATT_SESSION_USER,user);
        else
            session.setAttribute(ATT_SESSION_USER,null);


        /* Si et seulement si la case du formulaire est cochée */
        if ( req.getParameter( CHAMP_MEMOIRE ) != null ) {
            /* Récupération de la date courante */
            LocalDate dt = LocalDate.now();
            /* Formatage de la date et conversion en texte */
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern( FORMAT_DATE );
            String dateDerniereConnexion = dt.format(formatter).toString();
            /* Création du cookie, et ajout à la réponse HTTP */
            setCookie( resp, COOKIE_DERNIERE_CONNEXION, dateDerniereConnexion, COOKIE_MAX_AGE );
        } else {
            /* Demande de suppression du cookie du navigateur */
            setCookie( resp, COOKIE_DERNIERE_CONNEXION, "", 0 );
        }

        /* Stockage du formulaire et du bean dans l'objet request */
        req.setAttribute( ATT_LOGIN_ADHERENT_FORM, adherentForm );
        
        this.getServletContext().getRequestDispatcher("/indexHandler").forward(req, resp);

	}

    /**
     * Méthode utilitaire gérant la récupération de la valeur d'un cookie donné
     * depuis la requête HTTP.
     */
    private static String getCookieValue( HttpServletRequest request, String nom ) {
        Cookie[] cookies = request.getCookies();
        if ( cookies != null ) {
            for ( Cookie cookie : cookies ) {
                if ( cookie != null && nom.equals( cookie.getName() ) ) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    
    /*
     * Méthode utilitaire gérant la création d'un cookie et son ajout à la
     * réponse HTTP.
     */
    private static void setCookie( HttpServletResponse response, String nom, String valeur, int maxAge ) {
        Cookie cookie = new Cookie( nom, valeur );
        cookie.setMaxAge( maxAge );
        response.addCookie( cookie );
    }

}