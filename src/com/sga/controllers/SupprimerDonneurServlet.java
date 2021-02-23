package com.sga.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sga.entities.Donneur;
import com.sga.repositories.HibernateDonneurPersister;

/**
 * Servlet implementation class SupprimerDonneur
 */
@WebServlet( "/supprimerDonneur" )
public class SupprimerDonneurServlet extends HttpServlet {
    private static final long  serialVersionUID     = 1L;

    public static final String PARAMETRE_ID_DONNEUR = "donneurID";

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        HibernateDonneurPersister donneurPersister = new HibernateDonneurPersister();
        String url = request.getHeader( "referer" );
        String vue = "/" + url.substring( url.lastIndexOf( '/' ) + 1 );
        request.setAttribute( "vue", vue );

        /* Recuperation du param */
        String idDonneur = getValeurParametre( request, PARAMETRE_ID_DONNEUR );

        // si l'id et la map ne sont pas vides

        if ( idDonneur != null ) {

            Long id = Long.parseLong( idDonneur );

            // suppression du donneur de la BD
            Donneur donneur = donneurPersister.read( id );

            donneurPersister.delete( donneur );

        }
        /* Redirection vers la fiche récapitulative */
        response.sendRedirect( request.getContextPath() + vue );
    }

    /*
     * Méthode utilitaire qui retourne null si un paramètre est vide, et son
     * contenu sinon.
     */
    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}
