
{{- define "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.fullname" -}}
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


{{- define "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.labels" -}}
helm.sh/chart: {{ include "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.chart" . }}
{{ include "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebb0291c-24a5-4edb-bb62-b8b43a0e1788.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}