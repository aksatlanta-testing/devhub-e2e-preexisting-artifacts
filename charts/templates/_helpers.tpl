
{{- define "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.fullname" -}}
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


{{- define "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.labels" -}}
helm.sh/chart: {{ include "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.chart" . }}
{{ include "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa64afd5b-2715-40e4-8fe1-2659c1582f1f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}