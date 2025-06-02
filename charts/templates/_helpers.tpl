
{{- define "go-echod205ba5f-31ef-4740-aeef-276510ed172b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod205ba5f-31ef-4740-aeef-276510ed172b.fullname" -}}
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


{{- define "go-echod205ba5f-31ef-4740-aeef-276510ed172b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod205ba5f-31ef-4740-aeef-276510ed172b.labels" -}}
helm.sh/chart: {{ include "go-echod205ba5f-31ef-4740-aeef-276510ed172b.chart" . }}
{{ include "go-echod205ba5f-31ef-4740-aeef-276510ed172b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod205ba5f-31ef-4740-aeef-276510ed172b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod205ba5f-31ef-4740-aeef-276510ed172b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}