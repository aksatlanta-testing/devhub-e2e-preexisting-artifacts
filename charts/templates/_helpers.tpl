
{{- define "go-echoff087e56-2168-4024-9e68-294f1183052c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff087e56-2168-4024-9e68-294f1183052c.fullname" -}}
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


{{- define "go-echoff087e56-2168-4024-9e68-294f1183052c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff087e56-2168-4024-9e68-294f1183052c.labels" -}}
helm.sh/chart: {{ include "go-echoff087e56-2168-4024-9e68-294f1183052c.chart" . }}
{{ include "go-echoff087e56-2168-4024-9e68-294f1183052c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff087e56-2168-4024-9e68-294f1183052c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff087e56-2168-4024-9e68-294f1183052c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}