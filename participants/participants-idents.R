# ..........................................................
# 2025-05-29 -- 4R/um
# keep track of the participants                -----------
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
# ..........................................................

library(tidyverse)
library(janitor)
library(magrittr)
library(rvest)
library(httr)
library(glue)

timestamp <- "260521"


# all people from DST -----------------------------------------------------

# Function to scrape contact information from a single office page
scrape_dst_office <- function(office_number) {
    # Format office number with leading zero if needed
    office_code <- sprintf("%02d", office_number)

    # Construct URL
    url <- paste0(
        "https://www.dst.dk/da/OmDS/Organisation/TelefonbogOrg?kontor=",
        office_code
    )

    # Read the page
    page <- read_html(url)

    # Extract the table - look for the main contact table
    table <- page |>
        html_table(fill = TRUE) |>
        pluck(1) |> # Get the first table
        set_colnames(letters[1:5]) |>
        # subsection
        fill(e) |>
        # heep only the lines with emails
        filter(d |> str_detect("@")) |>
        separate(
            b,
            into = c("title", "name"),
            sep = "                        "
        ) |>
        transmute(
            ident = d |> str_sub(1, 3) |> toupper(),
            name,
            title = a,
            email = d,
            phone = c,
            kontor = office_code,
            team = e
        )

    return(table)

    cat(str_glue(
        "Extracted data for {nrow(table)} employees from kontor {office_code}."
    ))
}


# Scrape all offices from 01 to 23, 14, 19 and 20 do not exist
dst_contacts <- map_dfr(c(1:13, 15:18, 21:23, 29), scrape_dst_office)

save(dst_contacts, file = "participants/dst-all-contacts.rda")
# save a timestamped copy for archiving
# UPDATE THE DATE PART
write_csv(
    dst_contacts,
    str_glue("participants/archive/dst-all-contacts-{timestamp}.csv")
)

load("participants/dst-all-contacts.rda")


# additional -- people asked to be included via email ---------------------

idents_via_email_requests <- c(
    "NJN",
    "CUZ",
    "RIE",
    "SLF",
    "KLE",
    "AKE",
    "MNT",
    "JOC",
    "PSL",
    "LHM",
    "EHE",
    "SDN",
    "RJD",
    "ALU",
    "ABN",
    "SKR",
    "GPM",
    "OWY",
    "JAM",
    "LWH",
    "MJS",
    "KKE",
    "NIT"
)

# consultancy office 15kt ------------------------------------

idents_k15 <- c(
    "MIK",
    "VHF",
    "AMI",
    "CFL",
    "JPO",
    "TRN",
    "KWH",
    "KVN",
    "LLJ",
    "AMF",
    "LOP",
    "ETH",
    "GAN",
    "SND",
    "APF",
    "DCH",
    "HNN",
    "LNJ",
    "LMI",
    "BOO",
    "MZP",
    "NAV",
    # "TRG", # asked to be removed
    # "KMH", # asked to be removed
    "JEJ",
    "LKE",
    "CLN",
    "EAP",
    "NIM"
)


# 2025-05-16 meeting ------------------------------------------------------

idents_250516 <- c(
    "MZP",
    "MHG",
    "HNN",
    "LMI",
    "GAN",
    "LNJ",
    "BOO",
    "MIM",
    "EBA",
    "HFE",
    "FSM",
    "JHD",
    "MBD",
    "PJV",
    "SVM",
    "AWH",
    "KLE",
    "JGM",
    "ASF",
    "AYB",
    "HKC",
    "JCK",
    "AMF",
    "PHP"
)

# 2025-09-26 meeting IKX quarto -------------------------------------------

idents_250926 <- c(
    "IKX",
    "ETH",
    "AEL",
    "JGM",
    "HOH",
    "PHP",
    "AYB",
    "CJA",
    "EMF",
    "LMI",
    "SND",
    "DCH",
    "ATB",
    "EBM",
    "JCK",
    "HFE",
    "LNJ",
    "AWH",
    "AMF",
    "GAN",
    "MNT",
    "MIM"
)


#  2025-10-24 meeting JHD vsc + AYB round ---------------------------------

idents_251024 <- c(
    "IKX",
    "MZP",
    "GPM",
    "JCK",
    "EBM",
    "MNT",
    "MHG",
    "JAM",
    "LWH",
    "JOC",
    "PHP",
    "SVM",
    "OWY",
    "DCH",
    "SND",
    "ETH",
    "EMF",
    "AYB",
    "IMC",
    "GAN",
    "LNJ"
)


# 2025-11-28 meeting PHP DSTmetadata --------------------------------------

idents_251128 <- c(
    "PHP",
    "IKX",
    "JCK",
    "LWH",
    "SPN",
    "EBM",
    "JCK",
    "SVM",
    "AKE"
)


# 2026-02-27 meeting IKX parquet ------------------------------------------

idents_260227 <- c(
    "IKX",
    "MHG",
    "RIE",
    "JHD",
    "JOC",
    "JAM",
    "EHE",
    "PHP",
    "ETH",
    "ABN",
    "KKE",
    "SUM",
    "AWH",
    "MJS",
    "ASF"
)


# 2026-04-24 meeting JOC & IKX --------------------------------------------

idents_260424 <- c(
    "IKX",
    "LNJ",
    "SND",
    "LMI",
    "AMF",
    "PHP",
    "JAM",
    "MUT",
    "EHE",
    "CWB",
    "LCR",
    "AYB",
    "AWH",
    "JOC",
    "AMF"
)


# R course participants UPD 2026-04-17 ---------------------------------------------------

idents_r_course <- c(
    # April 2026
    "CWB",
    "MFS",
    "LCR",
    "CTI",
    "LOP",
    "CRS",
    "ROV",
    "NAV",
    # September 2025
    "EMF",
    "ABT",
    "IMC",
    "DCH",
    "PLH",
    "CJA",
    "HWK",
    "OEK",
    "SMU",
    "JKP",
    "MWC",
    "JHO",
    "CJA",
    "HWK",
    "OEK",
    "SMU",
    "JKP",
    "MWC",
    # May 2025
    "JHO",
    "LHA",
    "JBE",
    "ASF"
)


# 2606 -- dataviz course participants  ------------------------------------

idents_dataviz_course <- c(
    "EHE",
    "MZP",
    "AWH",
    "MJS"
)


# no longer at DST --------------------------------------------------------
idents_left <- c(
    "FSM",
    "MBD",
    "HOH",
    "ATB",
    "OWY",
    "SPN",
    "SUM",
    "MUT",
    "SMU",
    "LHM"
)


# common idents -----------------------------------------------------------

# take all objects with "idents" in name from global env and get unique
idents <- ls() |>
    extract(ls() |> str_detect("idents")) |>
    mget() |>
    unlist() |>
    unname() |>
    unique()


# participants ------------------------------------------------------------

armen <- dst_contacts |>
    filter(ident %in% idents) |>
    filter(!ident %in% idents_left)

# # those who left
# anti_join(
#     tibble(ident = idents),
#     armen |> select(ident),
#     by = "ident"
# )

# save the latest list
save(armen, file = "participants/armen.rda")

# save a timestamped copy for archiving
# UPDATE THE DATE PART
write_csv(armen, str_glue("participants/archive/armen-{timestamp}.csv"))

# load back
load("participants/armen.rda")

# copy emails to clipboard
armen |>
    pull(email) |>
    clipr::write_clip()
