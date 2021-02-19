<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ajouter un don</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/css/tailwind.output.css" />
    <script
      src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
      defer
    ></script>
    <script src="./assets/js/init-secretaire.js"></script>
    <script src="./assets/js/init-don.js"></script>
  </head>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen}"
    >
      <c:import url="Menu/sideMenuDonateurPage.jsp"></c:import>
      <div class="flex flex-col flex-1">
        <c:import url="Menu/headerSecretaire.jsp"></c:import>

        <main class="h-full pb-16 overflow-y-auto">
          <form method="post" action="">
            <div class="container px-6 mx-auto grid">
              <h2
                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
              >
                Enregistrer un don
              </h2>

              <!-- General elements -->
              <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
              >
                Formulaire donateur
              </h4>
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
                <div class="mt-1 text-sm">
                  <span class="text-gray-700 font-medium dark:text-gray-400">
                    Donateur
                  </span>
                  <div class="mt-2">
                    <label
                      class="inline-flex items-center text-gray-600 dark:text-gray-400"
                    >
                      <input
                        type="radio"
                        class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        name="accountType"
                        value="nouveau"
                        checked
                        onclick="show()"
                      />
                      <span class="ml-2">Nouveau donateur</span>
                    </label>
                    <label
                      class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                    >
                      <input
                        type="radio"
                        class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        name="accountType"
                        value="ancien"
                        onclick="hide()"
                      />
                      <span class="ml-2">Ancien donateur</span>
                    </label>
                  </div>
                </div>
                <div id="nouveauDonateur">
                  <!--Debut formulaire d'un nouveau donateur-->
                  <label class="block mt-4 text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400">
                      Type de donateur
                    </span>
                    <select
                      class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                      onchange="typeDonateur(this)"
                      name="typeDonateur"
                    >
                      <option value="physique">Physique</option>
                      <option value="morale">Morale</option>
                    </select>
                  </label>
                  <div id="morale" style="display: none">
                    <label class="mt-4 block text-sm">
                      <span class="text-gray-700 font-medium dark:text-gray-400"
                        >Nom
                      </span>
                      <input
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="Nom"
                        name="nomDonneurMorale"
                    	value="<c:out value="${donneur.nom}" />"
                      />
                      <span class="text-xs text-red-600 dark:text-red-400">
                        <c:out value="${donneurForm.erreurs['nomDonneurMorale']}" />
                      </span>
                    </label>
                  </div>
                  <div id="physique">
                    <label class="mt-4 block text-sm">
                      <span class="text-gray-700 font-medium dark:text-gray-400"
                        >Nom
                      </span>
                      <input
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="Last name"
                        name="nomDonneurPhysique"
                    	value="<c:out value="${donneur.nom}" />"
                      />
                      <span class="text-xs text-red-600 dark:text-red-400">
                       <c:out value="${donneurForm.erreurs['nomDonneurPhysique']}" />
                      </span>
                    </label>
                    <label class="mt-4 block text-sm">
                      <span class="text-gray-700 font-medium dark:text-gray-400"
                        >Prenom
                      </span>
                      <input
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="First name"
                        name="prenomDonneurPhysique"
                    	value="<c:out value="${donneur.prenom}" />"
                      />
                      <span class="text-xs text-red-600 dark:text-red-400">
                        <c:out value="${donneurForm.erreurs['prenomDonneurPhysique']}"/>
                      </span>
                    </label>
                    <label class="mt-4 block text-sm">
                      <span class="text-gray-700 font-medium dark:text-gray-400"
                        >CIN
                      </span>
                      <input
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="CIN"
                        name="cinDonneurPhysique"
                    	value="<c:out value="${donneur.cin}" />"
                      />
                      <span class="text-xs text-red-600 dark:text-red-400">
                        <c:out value="${donneurForm.erreurs['cinDonneurPhysique']}" />
                      </span>
                    </label>
                  </div>
                  <!--Formulaire-->
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Email
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Email"
                      name="emailDonneurMorale"
                      value="<c:out value="${donneur.email}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donneurForm.erreurs['emailDonneurMorale']}" />
                    </span>
                  </label>
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Telephone
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Telephone"
                      name="telephoneDonneurMorale"
                      value="<c:out value="${donneur.telephone}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${ donneurForm.erreurs['telephoneDonneurMorale']}" />
                    </span>
                  </label>
                  <label class="block mt-4 text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Adresse</span
                    >
                    <textarea
                      class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                      rows="3"
                      placeholder="Adresse"
                      name="adresseDonneurMorale"
                      value="<c:out value="${donneur.adresse}" />"
                    ></textarea>
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donneurForm.erreurs['adresseDonneurMorale']}" />
                    </span>
                  </label>
                  
                  <label class="bl ock mt-4 text-sm">
    				<span class="text-gray-700 font-medium dark:text-gray-400">
     					 Structure
    				</span>
                  <select
                          class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                          name="listStructure"
                  >

					<c:forEach items="${structureList}" var="structure" varStatus="boucle">
                      <option value="${structure.idStructure}"><c:out value="${structure.nom}"/> </option>
                    </c:forEach>

                  </select>
                </label>
                </div>
                <!--Fin formulair d'un nouveau donateur-->
                <div id="ancienDonateur">
                <!--Ancien donateur-->
                      <label class="block mt-4 text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400">
                      Type de donateur
                    </span>
                          <select
                                  class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                  onchange="listeDesDonateurs(this)"
                                  name=""
                          >
                              <option value="physique">Physique</option>
                              <option value="morale">Morale</option>
                          </select>
                      </label>
                      <div id="listeMorale" style="display: none">
                          <label class="block mt-4 text-sm">
                    <span class="text-gray-700 dark:text-gray-400">
                      Liste des donateurs
                    </span>
                              <select
                                      class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-multiselect focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                      multiple
                                      name="listAncienDonneur"
                              >
								
						<c:forEach items="${donneurMoraleList}" var="monDonateur" varStatus="boucle">
                      		<option>${monDonateur.nom}</option>
						</c:forEach>
								
                              </select>
                          </label>
                      </div>
                      <div id="listePhysique">
                          <label class="block mt-4 text-sm">
                    <span class="text-gray-700 dark:text-gray-400">
                      Liste des donateurs
                    </span>
                              <select
                                      class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-multiselect focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                      multiple
                                      name="listAncienDonneur"
                              >
                              
                             <c:forEach items="${donneurPhysiqueList}" var="donateur" varStatus="boucle">
                      			<option value=""><c:out value="${donateur.nom}" /></option>
                      		 </c:forEach> 
                      		
                              </select>
                          </label>
                      </div>
                  </div>
                  <!--fin ancien donateur-->
              </div>

              <!-- Don inputs -->
              <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
              >
                Formulaire du don
              </h4>
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
                <label class="mt-2 block text-sm">
                  <span class="text-gray-700 font-medium dark:text-gray-400"
                    >Date
                  </span>
                  <input
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    type="date"
                    name="dateDon"
                    value="<c:out value="${don.dateDon}" />"
                  />
                  <span class="text-xs text-red-600 dark:text-red-400">
                    <c:out value="${donForm.erreurs['dateDon']}" />
                  </span>
                </label>

                <label class="block mt-4 text-sm">
                  <span class="text-gray-700 font-medium dark:text-gray-400">
                    Type de paiement
                  </span>
                  <select
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    onchange="typePaiement(this)"
                    name="typeDon"
                  >
                    <option value="espece">Espèce</option>
                    <option value="cheque">Chèque</option>
                    <option value="versement">Versement</option>
                  </select>
                </label>
                <div id="versement" style="display: none">
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Numéro du compte banquaire
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Numéro du compte banquaire"
                      name="numeroCompteBanqueDonVersement"
                      value="<c:out value="${don.numeroCompteBanque}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donForm.erreurs['numeroCompteBanqueDonVersement']}" />
                    </span>
                  </label>
                </div>
                <div id="cheque" style="display: none">
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Numéro du compte banquaire
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Numéro du compte banquaire"
                      name="numeroCompteBanqueDonCheque"
                      value="<c:out value="${don.numeroCompteBanque}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donForm.erreurs['numeroCompteBanqueDonCheque']}" />
                    </span>
                  </label>
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Date du chèque
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      type="date"
                      name="dateChequeDonCheque"
                      value="<c:out value="${don.dateCheque}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donForm.erreurs['dateChequeDonCheque']}" />
                    </span>
                  </label>
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Date du dépot
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      type="date"
                      name="dateDepotDonCheque"
                      value="<c:out value="${don.dateDepot}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donForm.erreurs['dateDepotDonCheque']}" />
                    </span>
                  </label>
                  <label class="mt-4 block text-sm">
                    <span class="text-gray-700 font-medium dark:text-gray-400"
                      >Nom de la banque
                    </span>
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="nom banque"
                      name="nomBanqueDonCheque"
                      value="<c:out value="${don.nomBanque}" />"
                    />
                    <span class="text-xs text-red-600 dark:text-red-400">
                      <c:out value="${donForm.erreurs['nomBanqueDonCheque']}" />
                    </span>
                  </label>
                </div>
                <label class="mt-4 block text-sm">
                  <span class="text-gray-700 font-medium dark:text-gray-400"
                    >Montant
                  </span>
                  <input
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  	name="montant"
                    value="<c:out value="${don.montant}" />"
                  />
                  <span class="text-xs text-red-600 dark:text-red-400">
                    <c:out value="${donForm.erreurs['montant']}" />
                  </span>
                </label>
              </div>
              <div class="mb-8">
                <input
                  type="submit"
                  value="Enregistrer"
                  class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                />
              </div>
            </div>
          </form>
        </main>
      </div>
    </div>
  </body>
</html>