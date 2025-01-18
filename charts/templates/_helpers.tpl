
{{- define "go-echob75cda36-f3af-46d0-a986-a505b92dd714.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob75cda36-f3af-46d0-a986-a505b92dd714.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echob75cda36-f3af-46d0-a986-a505b92dd714.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob75cda36-f3af-46d0-a986-a505b92dd714.labels" -}}
helm.sh/chart: {{ include "go-echob75cda36-f3af-46d0-a986-a505b92dd714.chart" . }}
{{ include "go-echob75cda36-f3af-46d0-a986-a505b92dd714.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob75cda36-f3af-46d0-a986-a505b92dd714.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob75cda36-f3af-46d0-a986-a505b92dd714.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}