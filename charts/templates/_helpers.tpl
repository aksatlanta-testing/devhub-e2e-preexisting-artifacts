
{{- define "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.fullname" -}}
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


{{- define "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.labels" -}}
helm.sh/chart: {{ include "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.chart" . }}
{{ include "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69ef188b-050e-4124-80cb-58ed6c24550c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}