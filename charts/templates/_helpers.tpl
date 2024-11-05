
{{- define "go-echoff005e49-d368-4731-8006-80535e2665b2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff005e49-d368-4731-8006-80535e2665b2.fullname" -}}
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


{{- define "go-echoff005e49-d368-4731-8006-80535e2665b2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff005e49-d368-4731-8006-80535e2665b2.labels" -}}
helm.sh/chart: {{ include "go-echoff005e49-d368-4731-8006-80535e2665b2.chart" . }}
{{ include "go-echoff005e49-d368-4731-8006-80535e2665b2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff005e49-d368-4731-8006-80535e2665b2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff005e49-d368-4731-8006-80535e2665b2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}