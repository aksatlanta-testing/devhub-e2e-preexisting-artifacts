
{{- define "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.fullname" -}}
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


{{- define "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.labels" -}}
helm.sh/chart: {{ include "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.chart" . }}
{{ include "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1e3c5c2-e2e0-4bbf-949c-269c68178544.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}