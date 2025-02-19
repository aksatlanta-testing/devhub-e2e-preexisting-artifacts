
{{- define "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.fullname" -}}
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


{{- define "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.labels" -}}
helm.sh/chart: {{ include "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.chart" . }}
{{ include "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob6f3ff9b-43dc-4a36-887a-b16e4a495caf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}