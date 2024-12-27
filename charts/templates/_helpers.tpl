
{{- define "go-echocf664002-f58f-457d-94dc-73d6fad5164b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf664002-f58f-457d-94dc-73d6fad5164b.fullname" -}}
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


{{- define "go-echocf664002-f58f-457d-94dc-73d6fad5164b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf664002-f58f-457d-94dc-73d6fad5164b.labels" -}}
helm.sh/chart: {{ include "go-echocf664002-f58f-457d-94dc-73d6fad5164b.chart" . }}
{{ include "go-echocf664002-f58f-457d-94dc-73d6fad5164b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf664002-f58f-457d-94dc-73d6fad5164b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf664002-f58f-457d-94dc-73d6fad5164b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}