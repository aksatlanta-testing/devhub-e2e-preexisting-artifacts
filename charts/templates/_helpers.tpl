
{{- define "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.fullname" -}}
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


{{- define "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.labels" -}}
helm.sh/chart: {{ include "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.chart" . }}
{{ include "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo44d13f3e-9843-4edc-844f-3722135e77b7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}